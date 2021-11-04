SELECT DATE from annonces
    LEFT JOIN uniteslegales
    ON annonces.RCS = uniteslegales.SIREN
    WHERE DATE >= '2008-01-01'
    AND DATE <= NOW()
    AND uniteslegales.EFFECTIFS != 'NN'
    AND uniteslegales.EFFECTIFS >= '01'
    -- filtrer les sociétés civiles immobilières
    and uniteslegales.CATEGORIEJURIDIQUE <> all (array['6540', '6541', '6542', '6543','6544']) 
    and uniteslegales.CATEGORIEJURIDIQUE is not null
    AND (nature ~* 'jugement')
    ORDER BY EFFECTIFS DESC;
