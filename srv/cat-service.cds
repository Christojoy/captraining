using DataBase as db from '../db/data-model';

service Customer {

    entity Customers as projection on db.Customers;

}

service BookShop  @(path: '/BooksShop'){
    @odata.draft.enabled
    entity Books as projection on db.Books ;
    entity Authors as projection on db.Authors;
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