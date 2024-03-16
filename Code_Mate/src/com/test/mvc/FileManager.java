package com.test.mvc;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletResponse;

public class FileManager
{
	// 파일 다운로드
		//-- 다운로드할 파일이 정상적으로 존재할 경우 true 반환
		//   파일이 존재하지 않아 정상적인 처리가 이루어지지 않을 경우 false 반환
		// - saveFileName     : 서버에 저장된 파일의 이름
		// - originalFileName : 클라이언트가 업로드한 파일의 이름
		// - path             : 서버에 저장된 경로
		// - response         : HttpServletResponse 응답객체
		public static boolean doFileDownload(String saveFileName, String originalFileName, String path, HttpServletResponse response)
		{
			
			// 워크스페이스 - 물리적인 실제 파일이 존재하는 서버 경로 → 전체 경로
			String loadDir = path + File.separator + saveFileName;
			
			// 확인
			System.out.println(loadDir); 
			
			try
			{
				if (originalFileName == null || originalFileName.equals(""))
				{
					originalFileName = saveFileName;
				}
				
				//new String(originalFileName.getBytes("EUC-KR"), "ISO-8859-1");
				originalFileName = new String(originalFileName.getBytes("EUC-KR"), "ISO-8859-1");
				// 파일명을 EUC-KR 방식으로 가져와서 ISO-8859-1 인코딩 방식으로새로운 문자열을 구성한다.
				// UnsupportedEncodingException : 지원하지 않는 인코딩 방식일 경우 예외를 발생시킨다.
				
			}
			catch(UnsupportedEncodingException e)
			{
				System.out.println(e.toString());
			}
			
			
			try
			{
				File file = new File(loadDir);
				
				// 서버에 물리적인 파일이 존재할 때
				if (file.exists())
				{
					// 1. 배열 미리 생성.
					byte[] readByte = new byte[4*1024];		//-- 4096 byte == 4 kb
					
					// 2. 응답하는 ContentType 설정. [mine 타입, content 타입] - 브라우저에게 전송.
					//    바이트 기반의 스트림일 때 아래와 같이 구성한다.
					response.setContentType("application/octet-stream");
					// 3.               _________________________________ ← 약속       파일명을 넘긴 것을 확인. 
					response.setHeader("Content-disposition", "attachment;filename=" + originalFileName);
					
					
					// 4. 서버의 물리적 파일의 전체 경로로 FIleInputStream 객체 생성
					//    이 객체를 BufferedInputStream 객체로 감싸는 처리
					BufferedInputStream fis = new BufferedInputStream(new FileInputStream(file));
					
					OutputStream os = response.getOutputStream();
					
					int read;
					// readByte 로 읽어들여서 4 KB 만큼 써내고(os.write) ... 이 과정을 반복한다.
					// 값이 -1 이 된 것이면, 읽어들인 모든 byte 내용을 써냈음을 의미하는 것이므로 반복을 멈춘다.
					while ( (read=fis.read(readByte, 0, 4096)) != -1 )
					{
						os.write(readByte, 0, read);
					}
					
					// 버퍼의 내용을 밀어내기
					os.flush();
					
					// 리소스 반납하기
					os.close();
					fis.close();
					
					// 파일이 존재하는 상황이므로 true 반환
					
					return true;
					
				}
			}
			catch(Exception e)
			{
				System.out.println(e.toString());
			}
			
			// 파일이 존재하지 않아 정상적인 처리가 이루어지지 않는 상황이므로 false 반환
			return false;
			
		}// end doFileDownload()
		
		
		// 실제 서버의 파일 삭제(제거)
		public static void doFileDelete(String fileName, String path)
		{
			// 파일을 클라이언트가 받았을 때, 서버단에서 삭제하기를 희망하는 경우
			// 이 메소드를 사용하면 된다.
			try
			{
				File file = null;
				
				String fullFileName = path + File.separator + fileName;
				file = new File(fullFileName);
				
				// 파일이 존재하면 파일을 제거한다.
				if (file.exists())
				{
					file.delete();
				}
				
			}
			catch(Exception e)
			{
				System.out.println(e.toString());
			}
		}
}
