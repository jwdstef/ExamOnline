package cc.ryanc.util;

import java.io.File;
import java.util.ArrayList;

public class FileUtil {
    /**
     * 获取所有文件
     *
     * @param filepath
     * @return
     */
    public ArrayList<String> getFiles(String filepath) {
        ArrayList<String> filelist = new ArrayList<String>();
        File root = new File(filepath);
        File[] files = root.listFiles();
        for (File file : files) {
            if (file.isFile()) {
                filelist.add(file.getName());
            }
        }
        return filelist;
    }

    /**
     * 获取所有文件夹
     *
     * @param filepath
     * @return
     */
    public ArrayList<String> getDirs(String filepath) {
        ArrayList<String> dirlist = new ArrayList<String>();
        File root = new File(filepath);
        File[] files = root.listFiles();
        for (File file : files) {
            if (file.isDirectory()) {
                dirlist.add(file.getName());
            }
        }
        return dirlist;
    }
}
