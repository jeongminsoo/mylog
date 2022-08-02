package com.project.mylog.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.mylog.dao.TeaminBoardDao;
import com.project.mylog.model.TeaminBoard;
import com.project.mylog.util.Paging;

public class TeaminBoardServiceImpl implements TeaminBoardService {

	@Autowired
	private TeaminBoardDao teaminBoardDao;
	String backupPath = "D:\\pjw\\webPro\\source\\10_2ndProject\\mylog\\src\\main\\webapp\\teaminBoardFileUpload\\";

	@Override
	public List<TeaminBoard> teaminBoardList(String pageNum) {
		int teaminBoardTotCnt = teaminBoardDao.teaminBoardTotCnt();
		Paging paging = new Paging(teaminBoardTotCnt, pageNum, 15, 3);
		TeaminBoard teaminboard = new TeaminBoard();
		teaminboard.setStartRow(paging.getStartRow());
		teaminboard.setEndRow(paging.getEndRow());
		return null;
	}

	@Override
	public int teaminBoardTotCnt() {
		return teaminBoardDao.teaminBoardTotCnt();
	}

	@Override
	public int teaminBoardWrite(MultipartHttpServletRequest mRequest, TeaminBoard teaminboard) {
		teaminboard.setTiip(mRequest.getRemoteAddr());
		boolean result = false;
		String uploadPath = mRequest.getRealPath("teaminBoardFileUpload/");
		Iterator<String> params = mRequest.getFileNames(); // 파라미터이름 받음
		String tifilename = "";
		if (params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터의 첨부된 파일 객체
			System.out.println("파라미터 이름 : " + param);
			tifilename = mFile.getOriginalFilename(); // param으로 첨부한 파일의 원래 이름
			if (tifilename != null && !tifilename.equals("")) { // 첨부한 파일이 있을 경우
				// 저장할 파일이름이 서버의 파일과 중복될 경우 -> 파일명 변경
				if (new File(uploadPath + tifilename).exists()) {
					tifilename = System.currentTimeMillis() + "_" + tifilename;
				}
				try {
					mFile.transferTo(new File(uploadPath + tifilename));
					System.out.println("서버파일 : " + uploadPath + tifilename);
					System.out.println("백업파일 : " + backupPath + tifilename);
					result = fileCopy(uploadPath + tifilename, backupPath + tifilename);
					System.out.println(result == true ? tifilename + " 백업성공" : tifilename + "백업실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				// 파일 첨부 안 할 경우
				System.out.println("파일 첨부 안 함");
				result = true;
			}
		} // if
		teaminboard.setTifilename(tifilename); // 첨부한 파일 이름
		System.out.println(tifilename);
		return teaminBoardDao.teaminBoardWrite(teaminboard);
	}

	@Override
	public int teaminBoardHitUp(int tinum) {
		return teaminBoardDao.teaminBoardHitUp(tinum);
	}

	@Override
	public TeaminBoard teaminBoardDetail(int tinum) {
		teaminBoardDao.teaminBoardHitUp(tinum);
		return teaminBoardDao.teaminBoardDetail(tinum);
	}

	@Override
	public TeaminBoard teaminBoardModifyReplyView(int tinum) {
		return teaminBoardDao.teaminBoardDetail(tinum);
	}

	@Override
	public int teaminBoardModify(MultipartHttpServletRequest mRequest, TeaminBoard teaminboard) {
		teaminboard.setTiip(mRequest.getRemoteAddr());
		boolean result = false;
		String uploadPath = mRequest.getRealPath("teaminBoardFileUpload/");
		Iterator<String> params = mRequest.getFileNames(); // 파라미터이름 받음
		String tifilename = "";
		if (params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터의 첨부된 파일 객체
			System.out.println("파라미터 이름 : " + param);
			tifilename = mFile.getOriginalFilename(); // param으로 첨부한 파일의 원래 이름
			if (tifilename != null && !tifilename.equals("")) { // 첨부한 파일이 있을 경우
				// 저장할 파일이름이 서버의 파일과 중복될 경우 -> 파일명 변경
				if (new File(uploadPath + tifilename).exists()) {
					tifilename = System.currentTimeMillis() + "_" + tifilename;
				}
				try {
					mFile.transferTo(new File(uploadPath + tifilename));
					System.out.println("서버파일 : " + uploadPath + tifilename);
					System.out.println("백업파일 : " + backupPath + tifilename);
					result = fileCopy(uploadPath + tifilename, backupPath + tifilename);
					System.out.println(result == true ? tifilename + " 백업성공" : tifilename + "백업실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				// 파일 첨부 안 할 경우
				System.out.println("파일 첨부 안 함");
				result = true;
			}
		} // if
		teaminboard.setTifilename(tifilename); // 첨부한 파일 이름
		System.out.println(tifilename);
		return teaminBoardDao.teaminBoardModify(teaminboard);
	}

	@Override
	public int teaminBoardDelete(int tinum) {
		return teaminBoardDao.teaminBoardDelete(tinum);
	}

	@Override
	public int teaminBoardPreReply(TeaminBoard teaminboard) {
		return teaminBoardDao.teaminBoardPreReply(teaminboard);
	}

	@Override
	public int teaminBoardReply(MultipartHttpServletRequest mRequest, TeaminBoard teaminboard) {
		teaminBoardDao.teaminBoardPreReply(teaminboard);
		teaminboard.setTiip(mRequest.getRemoteAddr());
		boolean result = false;
		String uploadPath = mRequest.getRealPath("teaminBoardFileUpload/");
		Iterator<String> params = mRequest.getFileNames(); // 파라미터이름 받음
		String tifilename = "";
		if (params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터의 첨부된 파일 객체
			System.out.println("파라미터 이름 : " + param);
			tifilename = mFile.getOriginalFilename(); // param으로 첨부한 파일의 원래 이름
			if (tifilename != null && !tifilename.equals("")) { // 첨부한 파일이 있을 경우
				// 저장할 파일이름이 서버의 파일과 중복될 경우 -> 파일명 변경
				if (new File(uploadPath + tifilename).exists()) {
					tifilename = System.currentTimeMillis() + "_" + tifilename;
				}
				try {
					mFile.transferTo(new File(uploadPath + tifilename));
					System.out.println("서버파일 : " + uploadPath + tifilename);
					System.out.println("백업파일 : " + backupPath + tifilename);
					result = fileCopy(uploadPath + tifilename, backupPath + tifilename);
					System.out.println(result == true ? tifilename + " 백업성공" : tifilename + "백업실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				// 파일 첨부 안 할 경우
				System.out.println("파일 첨부 안 함");
				result = true;
			}
		} // if
		teaminboard.setTifilename(tifilename); // 첨부한 파일 이름
		System.out.println(tifilename);
		return teaminBoardDao.teaminBoardReply(teaminboard);
	}

	// fileCopy
	private boolean fileCopy(String serverFile, String backupFile) {
		boolean isCopy = false;
		// 복사로직
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			// 파일을 1byte씩 X 한번에 읽기위해 조정
			File file = new File(serverFile);
			is = new FileInputStream(serverFile);
			os = new FileOutputStream(backupFile);
			byte[] buff = new byte[(int) file.length()];
			while (true) {
				int nReadByte = is.read(buff);
				if (nReadByte == -1)
					break; // 파일 끝 ->break;
				os.write(buff, 0, nReadByte);
			}
			isCopy = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (os != null)
					os.close();
				if (is != null)
					is.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;

	}

}
