sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ns/mitigationsmanagement/test/integration/FirstJourney',
		'ns/mitigationsmanagement/test/integration/pages/MitigationsList',
		'ns/mitigationsmanagement/test/integration/pages/MitigationsObjectPage'
    ],
    function(JourneyRunner, opaJourney, MitigationsList, MitigationsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ns/mitigationsmanagement') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheMitigationsList: MitigationsList,
					onTheMitigationsObjectPage: MitigationsObjectPage
                }
            },
            opaJourney.run
        );
    }
);