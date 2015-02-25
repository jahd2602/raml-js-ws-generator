 
 $app->get('/songs', 'APIrequest', function () use ($app) {
        //---RAML-PARSER-USER-AREA-START---

        $app->render(200, ['msg','ok']);
        //---RAML-PARSER-USER-AREA-END---
    });
