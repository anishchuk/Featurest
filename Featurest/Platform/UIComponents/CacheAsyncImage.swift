//
//  CachedAsyncImage.swift
//  Featurest
//
//  Created by Slava Anishchuk on 31.10.2024.
//

import SwiftUI

struct CacheAsyncImage<Content>: View where Content: View {
    private let url: URL?
    private let scale: CGFloat
    private let transaction: Transaction
    private let content: (AsyncImagePhase) -> Content

    init(
        url: URL?,
        scale: CGFloat = 1.0,
        transaction: Transaction = .init(),
        @ViewBuilder content: @escaping (AsyncImagePhase) -> Content
    ) {
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }

    var body: some View {
        if let url, let cached = ImageCahe[url] {
            content(.success(cached))
        } else {
            AsyncImage(
                url: url,
                scale: scale,
                transaction: transaction
            ) { phase in
                cacheRender(phase: phase)
            }
        }
    }

    func cacheRender(phase: AsyncImagePhase) -> some View {
        if let url, case .success(let image) = phase {
            ImageCahe[url] = image
        }
        return content(phase)
    }
}

private final class ImageCahe {
    static private var cache: [URL: Image] = [:]
    static subscript(url: URL) -> Image? {
        get { ImageCahe.cache[url] }
        set { ImageCahe.cache[url] = newValue }
    }
}

#Preview {
    CacheAsyncImage(
        url: .init(string: "https://img.freepik.com/premium-psd/packaging-box-mockup_68185-773.jpg")!
    ) { phase in
        switch phase {
        case .empty:
            ProgressView()
        case .success(let image):
            image
        case .failure(let error):
            Text("Not Loaded")
        @unknown default:
            fatalError()
        }
    }
}
