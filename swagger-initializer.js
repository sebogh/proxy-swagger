window.onload = function() {
    window.ui = SwaggerUIBundle({
        url: "./openapi.yaml",
        dom_id: '#swagger-ui',
        deepLinking: true,
        presets: [
            SwaggerUIBundle.presets.apis,
            SwaggerUIStandalonePreset
        ],
        plugins: [
            SwaggerUIBundle.plugins.DownloadUrl,

            // Rewrite servers to the go through the proxy.
            // See: https://stackoverflow.com/a/68296752
            function() {
                return {
                    statePlugins: {
                        spec: {
                            wrapActions: {
                                updateJsonSpec: function(oriAction, system) {
                                    return (spec) => {
                                        spec.servers = [{url: window.location.origin+"/api"} ]
                                        return oriAction(spec)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
        ],
        layout: "StandaloneLayout"
    });
};
