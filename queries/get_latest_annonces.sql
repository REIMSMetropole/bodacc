SELECT RCS,DATE,EFFECTIFS, NATURE from annonces
    LEFT JOIN uniteslegales
    ON annonces.RCS = uniteslegales.SIREN
    WHERE DATE >= NOW() - INTERVAL '15 DAY'
    AND DATE <= NOW()
    AND uniteslegales.EFFECTIFS != 'NN'
    AND uniteslegales.EFFECTIFS >= '01'
    -- filtrer les sociétés civiles immobilières
    and uniteslegales.CATEGORIEJURIDIQUE <> all (array['6540', '6541', '6542','6543','6544'])
    AND (NATURE ~* 'jugement')
    ORDER BY EFFECTIFS DESC;
