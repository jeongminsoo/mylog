package com.project.mylog.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.mylog.dao.DiaryBoardDao;
import com.project.mylog.model.DiaryBoard;
import com.project.mylog.util.Paging;

@Service
public class DiaryBoardServiceImpl implements DiaryBoardService {
	@Autowired
	private DiaryBoardDao diaryDao;

	@Override
	public List<DiaryBoard> myDirayList(String mid, Date ddate, String pageNum) {
		DiaryBoard diaryBoard = new DiaryBoard();
		diaryBoard.setMid(mid);
		diaryBoard.setDdate(ddate);
		Paging paging = new Paging(diaryDao.myDiaryCnt(diaryBoard), pageNum, 5, 1);
		diaryBoard.setStartRow(paging.getStartRow());
		diaryBoard.setEndRow(paging.getEndRow());
		return diaryDao.myDirayList(diaryBoard);
	}

	@Override
	public List<DiaryBoard> diaryList(String mid, String pageNum) {
		DiaryBoard diaryBoard = new DiaryBoard();
		diaryBoard.setMid(mid);
		Paging paging = new Paging(diaryDao.myDiaryCnt(diaryBoard), pageNum, 5, 1);
		diaryBoard.setStartRow(paging.getStartRow());
		diaryBoard.setEndRow(paging.getEndRow());
		return diaryDao.diaryList(diaryBoard);
	}

	@Override
	public int myDiaryCnt(String mid, Date ddate) {
		DiaryBoard diaryBoard = new DiaryBoard();
		diaryBoard.setMid(mid);
		diaryBoard.setDdate(ddate);
		return diaryDao.myDiaryCnt(diaryBoard);
	}

	@Override
	public int diaryCnt(String mid) {
		DiaryBoard diaryBoard = new DiaryBoard();
		diaryBoard.setMid(mid);
		return diaryDao.diaryCnt(diaryBoard);
	}

	@Override
	public int diaryHitup(int dnum) {
		return diaryDao.diaryHitup(dnum);
	}

	@Override
	public DiaryBoard diaryContent(int dnum) {
		return diaryDao.diaryContent(dnum);
	}

	@Override
	public int diaryWrite(MultipartHttpServletRequest mRequest, DiaryBoard diaryBoard) {
		diaryBoard.setDip(mRequest.getLocalAddr());
		boolean result = false;
		String uploadPath = mRequest.getRealPath("diaryBoardFileUpload/");
		Iterator<String> params = mRequest.getFileNames(); // 파라미터이름 받음
		String tfilename = "";
		return 0;
	}

	@Override
	public int diaryModify(MultipartHttpServletRequest mRequest, DiaryBoard diaryBoard) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int diaryDelete(int dnum) {
		return diaryDao.diaryDelete(dnum);
	}

	
	private boolean fileCopy(String serverFile, String backupFile) {
		boolean isCopy = false;
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			File file = new File(serverFile);
			is = new FileInputStream(file);
			os = new FileOutputStream(backupFile);
			byte[] buff = new byte[(int) file.length()];
			while(true) {
				int nReadByte = is.read(buff);
				if(nReadByte == -1) break;
				os.write(buff, 0, nReadByte);
			}
			isCopy = true;
		}catch (IOException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(os!=null) os.close();
				if(is!=null) is.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return isCopy;
	}
	

}
