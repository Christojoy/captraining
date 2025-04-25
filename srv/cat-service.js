const cds = require("@sap/cds");


module.exports=cds.service.impl((srv)=>{
    // srv.before('CREATE','Customers', async(req)=>{
    //     console.log("hi");
    // }),

    // srv.after('each','Customers',req=>{
    //    console.log("gi")
    // })

    srv.on('CREATE','BookDetail',async(req)=>{
        let bk_Id=req.data.Book_Id;
        let bk_Name=await SELECT.from('DataBase_Books').columns('author_id', 'title').where({id:bk_Id})
        const auth_Name = await 
            SELECT.from('DataBase_Authors').columns('name').where({ID:bk_Name[0].AUTHOR_ID})
        
            // const results = await cds.run(
            //     SELECT.from('DataBase_Books')
            //         .join('DataBase_Authors')
            //         .on('DataBase_Books.author_ID = DataBase_Authors.ID')
            //         .where({ 'Books.ID': req.data.id })
            // );
            console.log(auth_Name[0].NAME);



        req.reply({
            "Book_Name":bk_Name[0].TITLE,
            "Author":auth_Name[0].NAME
        })
        
    })
})