//
//  ViewController.swift
//  HeroInterview
//
//  Created by Nicolas CHARVOZ on 16/01/2019.
//  Copyright © 2019 Nicolas Charvoz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let dataService = DataService(withAPIClient: APIClient.shared)

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect(x: 100, y: 100, width: 100, height: 100),
                                              collectionViewLayout: CustomUICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(cellType: ItemCollectionViewCell.self)
        collectionView.backgroundColor = .white
        
        return collectionView
    }()

    private lazy var filterView: FilterView = {
        let view = FilterView(frame: CGRect(x: 100, y: 100, width: 40, height: 50))
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupFilterView()
        setupCollectionView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        reloadData()
    }
}

private extension ViewController {
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self

        view.addSubview(collectionView)

        collectionView.topAnchor.constraint(equalTo: filterView.bottomAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    func setupFilterView() {
        filterView.delegate = self

        view.addSubview(filterView)

        filterView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        filterView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        filterView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        filterView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func reloadData() {
        dataService.fetchItems { [weak self] success in
            if success {
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataService.currentItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionView: ItemCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)

        guard dataService.currentItems.count > indexPath.row else {
            return UICollectionViewCell()
        }

        collectionView.configure(withViewModel: ItemViewModel(fromModel: dataService.currentItems[indexPath.row]))

        return collectionView
    }
}

extension ViewController: FilterServiceDelegate {
    func didSelectCell(withType type: FilterService.FilterType) {
        dataService.getItems(for: type)
        reloadData()
    }
}
