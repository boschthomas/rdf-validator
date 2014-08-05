package helper;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileHelper
{
	public static FileMeta uploadFile( MultipartHttpServletRequest request, MultipartFile mpf, String absolutePath, String relativePath )
	{
		FileMeta fileMeta = new FileMeta();

		fileMeta.setFileName( mpf.getOriginalFilename() );
		fileMeta.setFileSize( mpf.getSize() / 1024 + " Kb" );
		fileMeta.setFileType( mpf.getContentType() );

		try
		{
			fileMeta.setBytes( mpf.getBytes() );

			// copy file to local disk / relative to application context
			// ServletContext sc = request.getSession().getServletContext();
			// String fullPath = sc.getRealPath( relativePath );

			// System.out.println("relativePath" + relativePath);
			// System.out.println("fullPath" + fullPath);

			// FileCopyUtils.copy( mpf.getBytes(), new FileOutputStream(
			// fullPath + "/" + mpf.getOriginalFilename() ) );
			FileCopyUtils.copy( mpf.getBytes(), new FileOutputStream( absolutePath + "/" + relativePath + "/" + mpf.getOriginalFilename() ) );

		} catch (IOException e)
		{
			e.printStackTrace();
		}
		// if text plain
		if ( fileMeta.getFileType().equalsIgnoreCase( "text/plain" ) || fileMeta.getFileName().substring( fileMeta.getFileName().length() - 4, fileMeta.getFileName().length() ).equalsIgnoreCase( ".ttl" ) )
		{
			try
			{
				fileMeta.setFileContent( new String( fileMeta.getBytes(), "UTF-8" ) );
			} catch (UnsupportedEncodingException e)
			{
				e.printStackTrace();
			}
		} else
			fileMeta.setFileContent( "unable to show binary file content" );

		return fileMeta;
	}

	public static FileMeta getFileDetails( HttpServletRequest request, String absolutePath, String relativePath )
	{
		FileMeta fileMeta = new FileMeta();

		// ServletContext sc = request.getSession().getServletContext();
		// String fullPath = sc.getRealPath( relativePath );

		String fileContent = "";

		// System.out.println("relativePath" + relativePath);
		// System.out.println("fullPath" + fullPath);

		try
		{
			// File fileDir = new File( fullPath );
			File fileDir = new File( absolutePath + "/" + relativePath );

			fileMeta.setFileName( fileDir.getName() );

			BufferedReader in = new BufferedReader( new InputStreamReader( new FileInputStream( fileDir ), "UTF-8" ) );

			String str;
			while ((str = in.readLine()) != null)
			{
				fileContent += str + "\n";
			}

			fileMeta.setFileContent( fileContent );

			in.close();
		} catch (UnsupportedEncodingException e)
		{
			System.out.println( e.getMessage() );
		} catch (IOException e)
		{
			System.out.println( e.getMessage() );
		} catch (Exception e)
		{
			System.out.println( e.getMessage() );
		}

		return fileMeta;
	}

	/**
	 * Convert directory structure into dynatree JSON recursive = true ~ read
	 * also the child folder
	 * 
	 * @param folder
	 * @param filePath
	 * @return
	 */
	public static List<DynaTree> convertDirectoryToDynaTree( final File folder, String filePath, final boolean isRecursive )
	{
		int dynaTreeIndex = 0;
		List<DynaTree> dynaTreeChild = new ArrayList<DynaTree>();

		for ( final File fileEntry : folder.listFiles() )
		{
			if ( fileEntry.isDirectory() && isRecursive )
			{
				dynaTreeChild.add( new DynaTree( fileEntry.getName(), null, true, filePath + fileEntry.getName() + "/", null ) );
				dynaTreeChild.get( dynaTreeIndex ).setChildren( convertDirectoryToDynaTree( fileEntry, filePath + fileEntry.getName() + "/", isRecursive ) );

			} else
			{
				dynaTreeChild.add( new DynaTree( fileEntry.getName(), null, false, filePath + fileEntry.getName(), null ) );
			}
			dynaTreeIndex++;
		}
		return dynaTreeChild;
	}

}
