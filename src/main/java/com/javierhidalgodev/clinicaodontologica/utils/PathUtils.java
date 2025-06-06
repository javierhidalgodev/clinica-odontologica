package com.javierhidalgodev.clinicaodontologica.utils;

public class PathUtils {

    public static Integer isPathInfoID(String pathInfo) {
        String id = pathInfo.split("/")[1];
        int pathInfoLength = pathInfo.split("/").length;

        if (id.matches("\\d+") && pathInfoLength == 2) {
            return Integer.parseInt(id);
        }

        return null;
    }

    public static boolean isPathInfoNew(String pathInfo) {
        String[] pathInfoArray = pathInfo.split("/");
                
        return (pathInfoArray.length == 2 && "new".equals(pathInfoArray[1]));
    }
}
