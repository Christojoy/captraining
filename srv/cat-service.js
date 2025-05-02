const cds = require("@sap/cds");


module.exports=cds.service.impl((srv)=>{
    // srv.before('CREATE','Customers', async(req)=>{
    //     console.log("hi");
    // }),

    // srv.after('each','Customers',req=>{
    //    console.log("gi")
    // })

    srv.on('CREATE','BookDetail',async(req)=>{
        // Retrieve the Book_Id from the request data
        let bk_Id = req.data.Book_Id;

        // Query the DataBase_Books table to get the author_id and title of the book with the specified id
        let bk_Name = await SELECT.from('DataBase_Books').columns('author_id', 'title').where({ id: bk_Id });

        // Query the DataBase_Authors table to get the name of the author based on the author_id obtained from the previous query
        const auth_Name = await
            SELECT.from('DataBase_Authors').columns('name').where({ ID: bk_Name[0].AUTHOR_ID });

        // Uncommenting this section would allow for a more complex query that joins both tables
            // const results = await cds.run(
            //     SELECT.from('DataBase_Books')
            //         .join('DataBase_Authors')
            //         .on('DataBase_Books.author_ID = DataBase_Authors.ID')
            //         .where({ 'Books.ID': req.data.id })
            // );

        // Log the name of the author to the console for debugging purposes
            console.log(auth_Name[0].NAME);
        
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