//
//  TasksScreen.swift
//  dotodo
//
//  Created by Mohammad Al-Ahdal on 2018-04-12.
//  Copyright © 2018 Mohammad Al-Ahdal. All rights reserved.
//

import UIKit
import IGListKit

class TasksScreen : UIViewController, ListAdapterDataSource {
    
    var data : [Any] = ["hi", "eh"]
    
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return data as! [ListDiffable];
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        
        
        
        return TasksSectionController();
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        let redView = UIView()
        redView.frame = self.view.frame
        redView.backgroundColor = UIColor.red;
        
        return redView
    }
    
    
    
    lazy var adapter : ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self);
    }()
    var colletionView:UICollectionView!;
    
    override func viewDidAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.cyan;
        colletionView = UICollectionView(frame: self.view.frame, collectionViewLayout: UICollectionViewLayout.init());
        self.colletionView.backgroundColor = UIColor.brown;
        adapter.collectionView = colletionView;
        adapter.dataSource = self;
        
        self.view.addSubview(colletionView);
    }
}

class TasksSectionController: ListSectionController {
    
}
