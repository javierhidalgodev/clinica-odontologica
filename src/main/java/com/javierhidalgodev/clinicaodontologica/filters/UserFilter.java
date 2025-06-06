package com.javierhidalgodev.clinicaodontologica.filters;

import com.javierhidalgodev.clinicaodontologica.dto.user.UserDTO;
import com.javierhidalgodev.clinicaodontologica.logica.Secretario;
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
 * Nos basamos en el rol para dejar pasar a todos
 * los recursos, o por el contrario, filtrar qué
 * tipo de recursos se pueden visionar en relación
 * al tipo de profesional que accede.
 */
@WebFilter(filterName = "UserFilter", urlPatterns = {
    "/odontologists/*",
    "/secretaries/*",
    "/patients/new",
    "/work-schedule/*",
    "/users/*", 
    "/appointments/new/patient", 
//    "/appointments/new/professional",
//    "/appointments/new/confirmation",
//    "/appointments/reset",
//    "/appointments/new/ok"
})
public class UserFilter implements Filter {

    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;

    public UserFilter() {
    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession mySession = req.getSession();
        UserDTO userSession = (UserDTO) mySession.getAttribute("userSession");

        String servletPath = req.getServletPath().split("/")[1];

        if (userSession.getRole().equals("user")) {
            String pathInfo = req.getPathInfo();

            // Todas las rutas sin pathInfo o que NO contengan
            // "new" en el pathInfo, pasan a ser revisadas.
            // En caso contrario se redirige al index.
            if (pathInfo == null || !"new".equals(pathInfo.split("/")[1])) {
                
                // Si el perfil de "user" es un secretario
                // o el pathInfo incluye "patients" (independientemente
                // que sea secretario u odontólogo), se dejan
                // visualizar.
                // De lo contrario se redirige al index.
                if (userSession.getProfessional() instanceof Secretario || "patients".equals(servletPath)) {
                    chain.doFilter(request, response);
                    return;
                }
            }

            res.sendRedirect(req.getContextPath() + "/index");
            return;
        }

        // Los perfiles "admin" pueden leer todo
        chain.doFilter(request, response);
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
                log("UserFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("UserFilter()");
        }
        StringBuffer sb = new StringBuffer("UserFilter(");
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
