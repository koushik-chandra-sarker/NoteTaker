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

public class deleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            int noteId = Integer.parseInt(request.getParameter("note_id").trim());
            Session session = FactoryProvider.getFactory().openSession();
            Transaction t = session.beginTransaction();
            Note note = (Note) session.get(Note.class,noteId);
            session.delete(note);
            t.commit();
            session.close();
            response.sendRedirect("showNote.jsp");

        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
