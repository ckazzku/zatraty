import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.zatraty 1.0

Page {
    id: categoriesPage

    SilicaListView {
        id: listView

        PullDownMenu {
            MenuItem {
                text: qsTr("Add Category")
                onClicked: {
                    var dialog = pageStack.push(Qt.resolvedUrl("../components/NewCategoryDialog.qml"))
                    dialog.accepted.connect(function() {
                        categoryModel.add(dialog.name)
                    })
                }
            }
        }

        model: CategoryListModel {
            id: categoryModel
        }

        anchors.fill: parent

        header: PageHeader {
            title: qsTr("Categories")
        }

        delegate: BackgroundItem {
            id: delegate

            Label {
                x: Theme.paddingLarge
                text: name
                anchors.verticalCenter: parent.verticalCenter
                color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
            }

            onClicked: {
                var category = categoryModel.get(index)
                pageStack.push(Qt.resolvedUrl("CategoryPage.qml"), { "category": category })
            }
        }
        VerticalScrollDecorator {}
    }
}