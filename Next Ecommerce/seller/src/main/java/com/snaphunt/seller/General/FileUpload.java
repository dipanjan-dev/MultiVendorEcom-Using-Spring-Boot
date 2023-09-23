package com.snaphunt.seller.General;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileUpload {

    public static void createDirectory(String directoryPath) {
        File directory = new File(directoryPath);
        if (!directory.exists()) {
            directory.mkdirs(); // Recursively create directories if they don't exist
        }
    }

    public static void saveFile(String directoryPath, String fileName, MultipartFile file) throws IOException {
        createDirectory(directoryPath);
        File outputFile = new File(directoryPath, fileName);

        try (InputStream inputStream = file.getInputStream();
             OutputStream outputStream = new FileOutputStream(outputFile)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        }
    }
    public static void deleteFile(String filePath) {
        File fileToDelete = new File(filePath);
        if (fileToDelete.exists()) {
            if (fileToDelete.delete()) {
                System.out.println("File deleted successfully: " + filePath);
            } else {
                System.err.println("Failed to delete file: " + filePath);
            }
        } else {
            System.err.println("File not found: " + filePath);
        }
    }
    public static void deleteDirectory(String directoryPath) throws IOException {
        File directoryToDelete = new File(directoryPath);
        if (directoryToDelete.exists()) {
            FileUtils.deleteDirectory(directoryToDelete);
            System.out.println("Directory deleted successfully: " + directoryPath);
        } else {
            System.err.println("Directory not found: " + directoryPath);
        }
    }
}
