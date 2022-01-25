package egovframework.sth.global.common;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUtils {
	@Autowired
	private ServletContext ctx;
	//베이스 경로 리턴
	public String getBasePath(String more) {
		return ctx.getRealPath(more);
	}
	//경로 폴더 만들기
	public void makeDir(String path) {
		File file = new File(path);
		if(!file.exists()) {
			file.mkdir();
		}
	}
	//확장자 리턴
	public String getExt(String fileNm) {
		return fileNm.substring(fileNm.lastIndexOf(".")+1);
	}
	
	public String getRandomFileNm() {
		return UUID.randomUUID().toString();
	}
	
	public String getRandomFileNm(String orginalFileNm) {
		return getRandomFileNm()+"."+getExt(orginalFileNm);
	}
	
	public String saveFile(MultipartFile mf,String folder) {
		String basePath = getBasePath(folder);
		makeDir(basePath);
		String fileNm = getRandomFileNm(mf.getOriginalFilename());
		try {
			File file = new File(basePath,fileNm);
			mf.transferTo(file);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		return fileNm;
	}
	// 파일 삭제
	public boolean delFile(String path) {
		String basePath = getBasePath("/");
		File file = new File(basePath,path);
		if(file.exists()) {
			return file.delete();
	}
		return false;
	}
	//폴더 삭제
	public boolean delFolder(String path) {
		String basePath = getBasePath("/");
		File folder = new File(basePath,path);
		if(folder.exists()) {
			File[] folder_list = folder.listFiles();
			for(int i=0; i<folder_list.length; i++) {
				folder_list[i].delete();
			}
			folder.delete();
			return true;
		}
		return false;
	}
	// 해당 경로 파일명 리스트 가져오기
	public List<String> getFileNameList(String path){
		List<String> list = new ArrayList();
		File files = new File(path);
		File[] listofFiles = files.listFiles();
		if(listofFiles == null) {
			return null;
		}
		
		for(int i=0; i<listofFiles.length; i++) {
			if(listofFiles[i].isFile()) {
				list.add(listofFiles[i].getName());
			}else if(listofFiles[i].isDirectory()) {
				
			}
		}
		return list;
	}
	//해당 경로 객체 리스트 가져오기(미사용)
	public List<File> getFileObjectList(String path){
		List<File> list = new ArrayList<>();
		File files = new File(path);
		File[] listofFiles = files.listFiles();
		for(int i=0; i<listofFiles.length; i++) {
			if(listofFiles[i].isDirectory()) {
				continue;
			}
			list.add(listofFiles[i]);
		}
		return list;
	}
}
