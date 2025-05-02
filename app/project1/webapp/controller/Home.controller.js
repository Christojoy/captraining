sap.ui.define([
    "sap/ui/core/mvc/Controller"
], (Controller) => {
    "use strict";

    return Controller.extend("project1.controller.Home", {
      
        onAfterRendering(){
            oModel=this.getView().getModel();
        }
    });
});