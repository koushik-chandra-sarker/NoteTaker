package ServletController;

import Bean.Note;
import FactoryProvider.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

public class saveNoteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

       try {
           String title = request.getParameter("title");
           String content = request.getParameter("content");

           Note note = new Note(title, content, new Date());

           Session session = FactoryProvider.getFactory().openSession();
           Transaction t = session.beginTransaction();
           session.save(note);
           t.commit();
           session.close();
           PrintWriter pr = response.getWriter();
           pr.print("<div class='container-fluid text-center suc-message'><h2>Note is Added Successfully.</h2></div>");
           RequestDispatcher rd = request.getRequestDispatcher("addNote.jsp");
           rd.include(request,response);
       }
       catch (Exception e){
           e.printStackTrace();
       }

    }


}
