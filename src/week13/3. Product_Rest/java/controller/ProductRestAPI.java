package controller;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import bean_exam.Product;
import bean_exam.ProductService;

@Path("/products")
@Produces("application/json; charset=UTF-8")
public class ProductRestAPI {

    private static final ProductService productService = new ProductService();

    @GET
    @Path("/list")
    public Response getProductList() {
        List<Product> products = productService.findAll().stream()
                .sorted(Comparator.comparing(Product::getId))
                .collect(Collectors.toList());

        return Response.ok(toJsonArray(products), MediaType.APPLICATION_JSON_TYPE).build();
    }

    @GET
    @Path("/list/{pid}")
    public Response getProductInfo(@PathParam("pid") String pid) {
        Product product = productService.find(pid);
        if (product == null) {
            return Response.status(Response.Status.NOT_FOUND)
                    .entity("{\"error\":\"product not found\",\"pid\":\"" + escapeJson(pid) + "\"}")
                    .type(MediaType.APPLICATION_JSON_TYPE)
                    .build();
        }

        return Response.ok(toJsonObject(product), MediaType.APPLICATION_JSON_TYPE).build();
    }

    @DELETE
    @Path("/{pid}")
    public Response deleteProduct(@PathParam("pid") String pid) {
        boolean deleted = productService.delete(pid);
        if (!deleted) {
            return Response.status(Response.Status.NOT_FOUND)
                    .entity("{\"error\":\"product not found\",\"pid\":\"" + escapeJson(pid) + "\"}")
                    .type(MediaType.APPLICATION_JSON_TYPE)
                    .build();
        }

        return Response.ok("{\"message\":\"deleted\",\"pid\":\"" + escapeJson(pid) + "\"}", MediaType.APPLICATION_JSON_TYPE)
                .build();
    }

    private String toJsonArray(List<Product> products) {
        return products.stream()
                .map(this::toJsonObject)
                .collect(Collectors.joining(",", "[", "]"));
    }

    private String toJsonObject(Product product) {
        return new StringBuilder()
                .append("{")
                .append("\"id\":\"").append(escapeJson(product.getId())).append("\",")
                .append("\"name\":\"").append(escapeJson(product.getName())).append("\",")
                .append("\"maker\":\"").append(escapeJson(product.getMaker())).append("\",")
                .append("\"price\":").append(product.getPrice()).append(',')
                .append("\"date\":\"").append(escapeJson(product.getDate())).append("\"")
                .append("}")
                .toString();
    }

    private String escapeJson(String value) {
        if (value == null) {
            return "";
        }

        return value.replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\b", "\\b")
                .replace("\f", "\\f")
                .replace("\n", "\\n")
                .replace("\r", "\\r")
                .replace("\t", "\\t");
    }
}