package net.javaguides.todoapp.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BullShitController
 */
@WebServlet("/BullShitController")
public class BullShitController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BullShitController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("BullShitGenerator/bullshit.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String text = request.getParameter("text");
		String dir = getServletContext().getRealPath("/");
		File input = new File(dir + "BullShitGenerator/input.txt");
		if (!input.createNewFile())
		{
			input.delete();
			input.createNewFile();
		}
		Writer file = new OutputStreamWriter(new FileOutputStream(input), StandardCharsets.UTF_8);
		file.write(text);
		file.close();
		generateOutput();
		doGet(request, response);
	}
	
	private void generateOutput() throws IOException
	{
		String dir = getServletContext().getRealPath("/");
		List<String> processParameters = new ArrayList<String>();
	    processParameters.add("C:\\ProgramData\\Anaconda3\\python");
	    processParameters.add(dir + "BullShitGenerator/generate.py");
	    
	    ProcessBuilder processBuilder = new ProcessBuilder(processParameters);
		processBuilder.redirectErrorStream(true);

	    Process process = processBuilder.start();
	    // for reading the output from stream
        BufferedReader stdInput = new BufferedReader(
        		new InputStreamReader(process.getInputStream()));
        
        String s = null;
        while ((s = stdInput.readLine()) != null) {
            System.out.println(s);
        }

	    try {
			int exitCode = process.waitFor();
			System.out.println("Exit with code: " + exitCode);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
