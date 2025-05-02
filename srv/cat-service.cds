using DataBase as db from '../db/data-model';

service Customer {

    entity Customers as projection on db.Customers;

}

service BookShop  @(path: '/BooksShop'){
    // Enable OData draft support for the Books entity, allowing for draft functionality
    // such as saving changes without immediately committing them to the database.
    @odata.draft.enabled
    entity Books as projection on db.Books ;
    // Define the Authors entity as a projection on the db.Authors table,
    // allowing access to author-related data in the application.
    entity Authors as projection on db.Authors;

    // Define the Genres entity as a projection on the db.Genres table,
    // enabling retrieval of genre-related information for books in the application.
    entity Genres as projection on db.Genres;

    @cds.persistence.skip
    entity BookDetail{
        key Book_Id:String;
            Book_Name:String;
            Author:String;
            Genre:String;

    }
//     view FilteredOrdersAssoc as select {*, author.name} as Flatten
// from (
//   select from Books {*}
//   where ID=$now
// );
}