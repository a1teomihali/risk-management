sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ns/mitigationsmanagement/test/integration/FirstJourney',
		'ns/mitigationsmanagement/test/integration/pages/MitigationsList',
		'ns/mitigationsmanagement/test/integration/pages/MitigationsObjectPage',
		'ns/mitigationsmanagement/test/integration/pages/RisksObjectPage'
    ],
    function(JourneyRunner, opaJourney, MitigationsList, MitigationsObjectPage, RisksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ns/mitigationsmanagement') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheMitigationsList: MitigationsList,
					onTheMitigationsObjectPage: MitigationsObjectPage,
					onTheRisksObjectPage: RisksObjectPage
                }
            },
            opaJourney.run
        );
    }
);