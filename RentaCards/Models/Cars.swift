//
//  Cars.swift
//  RentaCards
//
//  Created by Jose Preatorian on 05-10-24.
//

import Foundation

struct Car {
    let id: Int
    let make: String
    let model: String
    let year: Int
    let image: String
    let pricePerDay: Double
    let IdBranch: Int
}

let carsList = [
    Car(id: 1, make: "Toyota", model: "Corolla", year: 2020, image: "https://chileautos.pxcrush.net/chileautos/cars/private/d1tiu15mrvcl5j39sjssu9ctr.jpg", pricePerDay: 30, IdBranch: 1),
    Car(id: 2, make: "Ford", model: "Focus", year: 2019, image: "https://storage.googleapis.com/foto_autosusados/automotoras/sinwm/908/01011146671-1-29-3.jpg", pricePerDay: 28, IdBranch: 1),
    Car(id: 3, make: "Honda", model: "Civic", year: 2021, image: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/2023_Honda_Civic_Type_R.jpg/1920px-2023_Honda_Civic_Type_R.jpg", pricePerDay: 35, IdBranch: 2),
    Car(id: 4, make: "Chevrolet", model: "Malibu", year: 2020, image: "https://upload.wikimedia.org/wikipedia/commons/c/cf/Chevrolet_Malibu_%282008-2011%29_1X7A7375.jpg", pricePerDay: 32, IdBranch: 2),
    Car(id: 5, make: "Nissan", model: "Altima", year: 2018, image: "https://wieck-nissanao-production.s3.amazonaws.com/photos/26b8feb400fe76e61c1423d38db55dbf961baa63/preview-928x522.jpg", pricePerDay: 30, IdBranch: 3),
    Car(id: 6, make: "Hyundai", model: "Elantra", year: 2021, image: "https://upload.wikimedia.org/wikipedia/commons/a/ac/0_Hyundai_Avante_%28CN7%29_FL_2.jpg", pricePerDay: 29, IdBranch: 3),
    Car(id: 7, make: "Kia", model: "Optima", year: 2022, image: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/2018_Kia_Optima_2_CRDi_ISG_1.6_facelift_Front.jpg/2880px-2018_Kia_Optima_2_CRDi_ISG_1.6_facelift_Front.jpg", pricePerDay: 33, IdBranch: 1),
    Car(id: 8, make: "Volkswagen", model: "Jetta", year: 2020, image: "https://cf-cdn-v6.volkswagen.at/media/Content_Model_Equipment_Lightbox_Child_MediaBig_Image_Component/58311-705459_lightbox-477604-mediaBig-child/dh-1143-00fe24/3cedc6f9/1727261677/gris-platino.png", pricePerDay: 34, IdBranch: 1),
    Car(id: 9, make: "Subaru", model: "Impreza", year: 2019, image: "https://carbrokerchile.cl/wp-content/uploads/2023/05/WhatsApp-Image-2023-03-15-at-13.59.37-825x483.jpeg", pricePerDay: 31, IdBranch: 2),
    Car(id: 10, make: "Mazda", model: "3", year: 2020, image: "https://inchcapelatam.sirv.com/Mazda/BHVVLAB/mazda-3sedan-caracteristicas-entry-2.0-7g-6mt-rojo-cristal.png", pricePerDay: 30, IdBranch: 3),
    Car(id: 11, make: "Chrysler", model: "300", year: 2021, image: "https://upload.wikimedia.org/wikipedia/commons/3/37/Chrysler-300C.jpg", pricePerDay: 36, IdBranch: 1),
    Car(id: 12, make: "Dodge", model: "Charger", year: 2020, image: "https://upload.wikimedia.org/wikipedia/commons/a/a9/Dodge_Charger_Hirschaid-20220709-RM-113717.jpg", pricePerDay: 38, IdBranch: 2),
    Car(id: 13, make: "Toyota", model: "Camry", year: 2021, image: "https://upload.wikimedia.org/wikipedia/commons/b/bd/2022_Toyota_Camry_Hybrid_XLE_in_Midnight_Black_Metallic%2C_Front_Right%2C_12-25-2021.jpg", pricePerDay: 34, IdBranch: 3),
    Car(id: 14, make: "Ford", model: "Mustang", year: 2022, image: "https://static.emol.cl/emol50/Fotos/2019/01/22/file_20190122170253.jpg", pricePerDay: 40, IdBranch: 1),
    Car(id: 15, make: "Honda", model: "Accord", year: 2019, image: "https://upload.wikimedia.org/wikipedia/commons/2/26/2023_Honda_Accord_LX%2C_front_left%2C_07-13-2023.jpg", pricePerDay: 32, IdBranch: 2),
    Car(id: 16, make: "Chevrolet", model: "Impala", year: 2020, image: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/0_CHEVROLET_IMPALA_0.jpg/1200px-0_CHEVROLET_IMPALA_0.jpg", pricePerDay: 33, IdBranch: 3),
    Car(id: 17, make: "Nissan", model: "Sentra", year: 2021, image: "https://alameda-administracion.azurewebsites.net/Archivos/normal/_20240527101910395_d1e439a2_7697_4d82_8835_0af5d962e414.jpg", pricePerDay: 27, IdBranch: 1),
    Car(id: 18, make: "Hyundai", model: "Sonata", year: 2022, image: "https://acnews.blob.core.windows.net/imgnews/medium/NAZ_331bf12eb1584708803ec9014a66f65d.jpg", pricePerDay: 35, IdBranch: 2),
    Car(id: 19, make: "Kia", model: "Soul", year: 2019, image: "https://www.rtautomotriz.com/images/MANEJALO/Ext229666-1.jpg", pricePerDay: 28, IdBranch: 3),
    Car(id: 20, make: "Volkswagen", model: "Passat", year: 2021, image: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/VW_Passat_B8_Limousine_2.0_TDI_Highline.JPG/1200px-VW_Passat_B8_Limousine_2.0_TDI_Highline.JPG", pricePerDay: 36, IdBranch: 1)
]
