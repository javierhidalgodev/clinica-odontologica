<%@page import="java.util.Iterator"%>

<div class="position-fixed p-3 text-white text" style="bottom: 20px; right: 20px; z-index: 1000; background-color: rgba(32, 32, 32, .8)">
    <%                Iterator<String> elementos = session.getAttributeNames().asIterator();

        while (elementos.hasNext()) {
            String nombre = elementos.next();
    %> 
    <p class="m-1"><%= nombre%></p>
    <% }
    %>

</div>