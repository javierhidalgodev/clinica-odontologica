package com.javierhidalgodev.clinicaodontologica.filters;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
import com.javierhidalgodev.clinicaodontologica.logica.Odontologo;
import com.javierhidalgodev.clinicaodontologica.logica.Secretario;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(filterName = "ProfessionalAccessFilter", urlPatterns = {
    "/odontologists/*",
    "/secretaries/*",
    "/patients/*",
    "/work-schedule/*",
    "/users/*",
    "/appointments/*",})
public class ProfessionalAccessFilter implements Filter {

    private static final boolean debug = true;

    private FilterConfig filterConfig = null;

    public ProfessionalAccessFilter() {
    }

    private UserDTO getUserSession(HttpServletRequest req) {
        HttpSession mySession = req.getSession(false);

        return (mySession != null) ? (UserDTO) mySession.getAttribute("userSession") : null;
    }

    private boolean isAuthorized(HttpServletRequest req, UserDTO userSession) {
        String requestURI = req.getRequestURI();
        System.out.println("FROM ProfessionalFilter: " + requestURI);

        if (userSession.getProfessional() instanceof Secretario) {
            return !requestURI.endsWith("/secretaries");
        }

        if (userSession.getProfessional() instanceof Odontologo) {
            return requestURI.contains("/patients") || requestURI.contains("/appointments");
        }
        
        return true;
    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        UserDTO userSession = getUserSession(req);
        if (userSession == null) {
            res.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        if(!isAuthorized(req, userSession)) {
            res.sendRedirect(req.getContextPath() + "/index");
            return;
        }
        
        chain.doFilter(request, response);
    }

    public void destroy() {
    }

    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("Demo:Initializing filter");
            }
        }
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }
}
