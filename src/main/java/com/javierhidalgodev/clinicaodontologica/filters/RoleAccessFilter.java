package com.javierhidalgodev.clinicaodontologica.filters;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
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

@WebFilter(filterName = "UserFilter", urlPatterns = {
    "/odontologists/new",
    "/secretaries/new",
    "/patients/new",
    "/work-schedule/new",
    "/users/new",
    "/appointments/new/*",})
public class RoleAccessFilter implements Filter {

    private static final boolean debug = true;

    private FilterConfig filterConfig = null;

    public RoleAccessFilter() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession mySession = req.getSession(false);
        if (mySession == null) {
            res.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        UserDTO userSession = (UserDTO) mySession.getAttribute("userSession");
        if (userSession == null) {
            res.sendRedirect(req.getContextPath() + "/login");
            return;
        }        

        String pathInfo = req.getPathInfo();
        System.out.println("UserFilter L95: PathInfo: " + pathInfo);

        if (userSession.getRole().equals("user")) {
            res.sendRedirect(req.getContextPath() + "/index");
            return;
        }

        // Los perfiles "admin" pueden leer todo
        chain.doFilter(request, response);
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("UserFilter:Initializing filter");
            }
        }
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }
}
