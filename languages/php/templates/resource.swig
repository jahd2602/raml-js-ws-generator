 {%for resource in resources%}
 $app->get('{{resource.relativeUri}}', 'APIrequest', function () use ($app) {
        //---RAML-PARSER-USER-AREA-START---

        $app->render(200, ['msg','ok']);
        //---RAML-PARSER-USER-AREA-END---
    });
{%endfor%}