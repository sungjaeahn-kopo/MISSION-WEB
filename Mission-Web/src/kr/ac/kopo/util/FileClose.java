package kr.ac.kopo.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

public class FileClose {

   public static void close(InputStream is) {

      if (is != null) {
         try {
            is.close();
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
   }

   public static void close(OutputStream os) {
      if (os != null) {
         try {
            os.close();
         } catch (Exception e) {
            e.printStackTrace();
         }
      }

   }

   public static void close(InputStream bis, InputStream is) {
      FileClose.close(bis);
      FileClose.close(is);
   }

   public static void close(OutputStream bos, OutputStream os) {
      FileClose.close(bos);
      FileClose.close(os);
   }
   
   public static void close(FileReader fr) {

      if (fr != null) {
         try {
            fr.close();
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
   }

   public static void close(FileWriter fw) {
      if (fw != null) {
         try {
            fw.close();
         } catch (Exception e) {
            e.printStackTrace();
         }
      }

   }
   
   public static void close(FileReader fr, FileWriter fw) {
      FileClose.close(fr);
      FileClose.close(fw);
   }

	public static void close(BufferedReader br, BufferedWriter bw) {
		
	}

	public static void close(PrintWriter pw) {
		// TODO Auto-generated method stub
		
	}

	public static void close(BufferedReader br) {
		// TODO Auto-generated method stub
		
	}


}