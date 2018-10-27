//
//  UICollectionView+Reusable.extension.swift
//  Speech
//
//  Created by flav on 27/10/2018.
//  Copyright © 2018 flav. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func registerReusableCell<T: UICollectionViewCell>(_: T.Type) where T: Reusable {
        if let nib = T.nib {
            register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
        } else {
            register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    func registerReusableHeaderView<T: UICollectionReusableView>(_: T.Type) where T: Reusable {
        if let nib = T.nib {
            register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier)
        } else {
            register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    func registerReusableFooterView<T: UICollectionReusableView>(_: T.Type) where T: Reusable {
        if let nib = T.nib {
            register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.reuseIdentifier)
        } else {
            register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T where T: Reusable {
        return dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
    func dequeueReusableHeaderView<T: UICollectionReusableView>(indexPath: IndexPath) -> T where T: Reusable {
        return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
    func dequeueReusableFooterView<T: UICollectionReusableView>(indexPath: IndexPath) -> T where T: Reusable {
        return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
}
