function area = area_roc(GT,segmented)
    
    [TPR,TNR,INFO]=vl_roc(GT,segmented);
    area=INFO.auc;

end

