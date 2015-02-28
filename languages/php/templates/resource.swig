{%for resource in resources%}
$app->group('{{resource.relativeUri}}', function () use ($app) {
    {%for method in resource.methods%}
    /**{%if method.description%}
    * {{method.description}}{%endif%}
    * Processes the {{method.method}} requests for {{resource.relativeUri}}{%if method.responses%}
    *
    * Responses:{%for statusCode,statusCodeProperties in method.responses%}
    *     {{statusCode}}{%if statusCodeProperties.body%}:{%for contentType,contentTypeProperties in statusCodeProperties.body%}
    *         {{contentType}}{%if contentTypeProperties.schema%}:
    *             {{contentTypeProperties.schema | raw}}{%endif%}{%endfor%}{%endif%}{%endfor%}{%endif%}{%if resource.uriParameters%}
    *
    * Uri parameters:{%for uriParameter,uriParameterProperties in resource.uriParameters%} {{uriParameter}}{%endfor%}{%endif%}
    */
    $app->{{method.method}}(null, 'APIrequest', function ({{resource.uriParameters | joinFromKeysToPHPParams}}) use ($app) {
            {%if method.queryParameters%}{%for param,paramProperties in method.queryParameters%}${{param}} = $app->request->params('{{param}}');
            {%endfor%}{%endif%}// ---WS-GENERATOR-USER-AREA-START---

            $response = [
                    'msg'=>'ok',
                    'error'=>false
            ];
            $app->render(200, $response);
            // ---WS-GENERATOR-USER-AREA-END---
    });
    {%endfor%}
    {# TODO % include "languages/php/templates/resource.swig" using resource.resources %#}
});
{%endfor%}