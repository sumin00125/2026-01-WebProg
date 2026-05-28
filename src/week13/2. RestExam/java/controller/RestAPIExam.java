package controller;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/exam")
@Produces("text/plain; charset=UTF-8")
public class RestAPIExam {

    @GET
    public Response getMessage() {
        return Response.ok("안녕하세요.", MediaType.TEXT_PLAIN_TYPE).build();
    }

    @POST
    public String postMessage(@QueryParam("msg") String msg) {
        if (msg == null || msg.trim().isEmpty()) {
            return "오류: msg query parameter를 입력하세요.";
        }

        return msg + " API Service";
    }
}