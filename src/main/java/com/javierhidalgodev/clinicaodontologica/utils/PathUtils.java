package com.javierhidalgodev.clinicaodontologica.utils;

public class PathUtils {

    public static Integer isPathInfoID(String pathInfo) {
        System.out.println("FROM PATHUTILS ID: " + pathInfo);
        int pathInfoLength = pathInfo.split("/").length;

        if (pathInfoLength == 2) {
            String id = pathInfo.split("/")[1];
            if (id.matches("\\d+")) {
                return Integer.parseInt(id);
            }
        }

        return null;
    }

    public static boolean isPathInfoNew(String pathInfo) {
        String[] pathInfoArray = pathInfo.split("/");

        return (pathInfoArray.length == 2 && "new".equals(pathInfoArray[1]));
    }

    public static boolean isValidURL(String pathInfo) {
        return isPathInfoID(pathInfo) != null || isPathInfoNew(pathInfo);
    }
}
