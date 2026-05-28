package controller;

import javax.ws.rs.ApplicationPath;

import org.glassfish.jersey.server.ServerProperties;
import org.glassfish.jersey.server.ResourceConfig;

@ApplicationPath("/api")
public class RestConfig extends ResourceConfig {

    public RestConfig() {
        property(ServerProperties.PROVIDER_PACKAGES, RestConfig.class.getPackage().getName());
    }
}