package cc.ryanc.test;

import java.util.ArrayList;

import cc.ryanc.util.FileUtil;

public class Test {
	public static void main(String[] args) {
		FileUtil fu = new FileUtil();
		ArrayList<String> list = fu.getFiles("/Users/ryan0up/Desktop");
		for (String a : list) {
			System.out.println(a);
		}
	}
}
