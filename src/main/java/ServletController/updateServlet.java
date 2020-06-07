package ServletController;

import Bean.Note;
import FactoryProvider.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

public class updateServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            int noteId = Integer.parseInt(request.getParameter("noteId"));
            Session session = FactoryProvider.getFactory().openSession();
            Transaction t =session.beginTransaction();
            Note note = session.get(Note.class, noteId);

            note.setTitle(title);
            note.setContent(content);
            note.setAddedDate(new Date());

            t.commit();
            session.close();
            response.sendRedirect("showNote.jsp");

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
