//
//  NewPostView.swift
//  momogum
//
//  Created by 조승연 on 1/22/25.
//

import SwiftUI

struct NewPostView: View {
    @Binding var tabIndex: Int
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = NewPostViewModel()

    let editedImage: UIImage
    let onReset: () -> Void

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            ScrollViewReader { scrollViewProxy in
                ScrollView {
                    VStack(alignment: .center, spacing: 0) {
                        HStack {
                            Button(action: {
                                onReset()
                                dismiss()
                            }) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.black)
                                    .font(.title2)
                            }
                            .frame(width: 44, height: 44)

                            Spacer()

                            Text("새 게시물")
                                .font(.headline)
                                .foregroundColor(.black)

                            Spacer()

                            Button(action: {
                                tabIndex = 0
                            }) {
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                                    .font(.title2)
                            }
                            .frame(width: 44, height: 44)
                        }
                        .padding(.horizontal, 16)
                        .frame(height: 60)

                        Spacer().frame(height: 38)

                        GeometryReader { geometry in
                            Image(uiImage: editedImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: geometry.size.width / editedImage.size.width * editedImage.size.height)
                                .clipped()
                        }
                        .frame(height: UIScreen.main.bounds.width / editedImage.size.width * editedImage.size.height)
                        .padding(.bottom, 30)

                        Spacer().frame(height: 40)

                        MealCategoryView(
                            categories: ["한식", "중식", "일식", "양식", "아시안", "패스트푸드", "카페", "기타"],
                            selectedCategory: $viewModel.newPost.selectedCategory
                        )
                        .onChange(of: viewModel.newPost.selectedCategory) { _, _ in
                            withAnimation {
                                scrollViewProxy.scrollTo("placeID", anchor: .top)
                            }
                        }

                        Spacer().frame(height: 32)

                        if viewModel.newPost.selectedCategory != nil {
                            MealInputView(tags: $viewModel.newPost.tags)
                                .id("placeID")
                                .padding(.top, 20)
                                .transition(.opacity)
                                .onChange(of: viewModel.newPost.tags) { _, _ in
                                    withAnimation {
                                        scrollViewProxy.scrollTo("placeID", anchor: .top)
                                    }
                                }
                        }

                        Spacer().frame(height: 36)

                        if !viewModel.newPost.tags.isEmpty {
                            MealPlaceView(mealPlace: $viewModel.newPost.mealPlace)
                                .id("placeID")
                                .onChange(of: viewModel.newPost.mealPlace) { _, _ in
                                    if !viewModel.newPost.mealPlace.isEmpty {
                                        withAnimation {
                                            scrollViewProxy.scrollTo("experienceID", anchor: .bottom)
                                        }
                                    }
                                }
                        }

                        Spacer().frame(height: 36)

                        if !viewModel.newPost.mealPlace.isEmpty {
                            MealExperienceView(newExperience: $viewModel.newPost.newExperience)
                                .id("experienceID")
                                .onChange(of: viewModel.newPost.newExperience) { _, newValue in
                                    if !newValue.isEmpty {
                                        withAnimation {
                                            scrollViewProxy.scrollTo("finalID", anchor: .bottom)
                                        }
                                    }
                                }
                        }

                        Spacer().frame(height: 36)

                        if !viewModel.newPost.newExperience.isEmpty {
                            MealIconView(selectedIcon: $viewModel.newPost.selectedIcon)
                                .id("iconID")
                                .onChange(of: viewModel.newPost.selectedIcon) { _, _ in
                                    if viewModel.newPost.selectedIcon != nil {
                                        withAnimation {
                                            scrollViewProxy.scrollTo("uploadButton", anchor: .bottom)
                                        }
                                    }
                                }
                        }

                        Spacer().frame(height: 20)

                        Color.clear.frame(height: 1).id("finalID")

                        if viewModel.newPost.selectedIcon != nil {
                            NavigationLink(destination: DonePostView(uploadedImage: editedImage)) {
                                Text("밥일기 업로드 하기")
                                    .font(.system(size: 17, weight: .bold))
                                    .frame(width: 340, height: 58)
                                    .foregroundColor(.white)
                                    .background(Color(hex: 0xE05A55))
                                    .cornerRadius(16)
                                    .padding(.top, 44)
                            }
                            .id("uploadButton")
                        }
                    }
                    .padding(.bottom, 20)
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationView {
        NewPostView(
            tabIndex: .constant(0),
            editedImage: UIImage(systemName: "photo") ?? UIImage(),
            onReset: {}
        )
    }
}
