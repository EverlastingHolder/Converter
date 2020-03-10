//
//  SearchBar.swift
//  Converter
//
//  Created by admin on 10.03.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import SwiftUI

struct SearchBar: View, UIViewRepresentable {
    
    @Binding
    var text: String
    
    func updateUIView(_ view: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        view.text = self.text
    }
    
    func makeCoordinator() -> SearchBar.Cordinator{
        return Cordinator(text: self.$text)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }


    class Cordinator : NSObject, UISearchBarDelegate{
        
        @Binding
        var text: String
        
        init(text: Binding<String>){
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
}
