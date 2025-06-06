package com.javierhidalgodev.clinicaodontologica.filters;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
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

/**
 *
 * @author Javi
 */
@WebFilter(filterName = "AuthFilter", urlPatterns = {"/"})
public class AuthFilter implements Filter {

    private static final boolean debug = true;

    private FilterConfig filterConfig = null;

    public AuthFilter() {}

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

//        doBeforeProcessing(request, response);
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String path = req.getRequestURI().substring(req.getContextPath().length());
        
// Excluir páginas públicas y recursos estáticos
        if (path.matches("/login") || path.matches("/register") || path.startsWith("/css") || path.startsWith("/img") || path.startsWith("/js") || path.startsWith("/vendor")) {
                
            HttpSession mySession = req.getSession(false);
            UserDTO user = null;
            if (mySession != null) {
                user = (UserDTO) mySession.getAttribute("userSession");
            }

            // Si el usuario no está logueado, redirige a login
            if (user != null) {
                res.sendRedirect(req.getContextPath() + "/index");
                return;
            }
            
            chain.doFilter(request, response);
            return;
        }

        HttpSession mySession = req.getSession(false);
        UserDTO user = null;
        if (mySession != null) {
            user = (UserDTO) mySession.getAttribute("userSession");
        }

        // Si el usuario no está logueado, redirige a login
        if (user == null) {
            if (mySession != null) {
                mySession.invalidate();
            }
            res.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        // Continuar con la petición si todo está correcto
        chain.doFilter(req, res);

//        doAfterProcessing(request, response);
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
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
                log("AuthFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("AuthFilter()");
        }
        StringBuffer sb = new StringBuffer("AuthFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }
}
