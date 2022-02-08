import 'dart:io';
import 'package:cropsecure/data/datasource/remote/dio/dio_client.dart';
import 'package:cropsecure/data/datasource/remote/exception/api_error_handler.dart';
import 'package:cropsecure/data/model/response/base/api_response.dart';
import 'package:cropsecure/utill/app_constants.dart';
import 'package:cropsecure/utill/sharedprefrence.dart';
import 'package:dio/dio.dart';

class AuthRepo{

  final DioClient dioClient;
  AuthRepo({this.dioClient});

  Future<ApiResponse> registration(String name,String phone,String villageName,
      String grama,String hobali,String subDistrictm,
      String districtName,String stateName,String password) async {

    FormData formData = FormData.fromMap({
      "name":name,
      "phone":phone,
      "village_name":villageName,
      "grama_panchayath":grama,
      "hobali":hobali,
      "sub_district":subDistrictm,
      "district_name":districtName,
      "state_name":stateName,
      "password":password,
    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.registerApi,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  Future<ApiResponse> editProfileApi(String name,String phone,String villageName,
      String grama,String hobali,String subDistrictm,
      String districtName,String stateName,String password) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.userId);
    FormData formData = FormData.fromMap({
      "name":name,
      "phone":phone,
      "village_name":villageName,
      "grama_panchayath":grama,
      "hobali":hobali,
      "sub_district":subDistrictm,
      "district_name":districtName,
      "state_name":stateName,
      // "password":password,
      "key": key
    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.editProfileApi,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  /////////////////set Verify Otp///////////////////////

  Future<ApiResponse> setVerifyOtpApi(String key) async {
    FormData formData = FormData.fromMap({
      "key":key
    });

    print(formData.fields);

    try {
      Response response = await dioClient.post(
          AppConstants.setVerifyOtp,
          data: formData);

      return ApiResponse.withSuccess(response);

    } catch (e) {

      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////verify Otp///////////////////////

  Future<ApiResponse> verifyOtpApi(String otp) async {

    var key = await SharedPrefManager.getPrefrenceString(AppConstants.userId);

    FormData formData = FormData.fromMap({
      "key":key,
      "otp":otp});

    print(formData.fields);

    try {
      Response response = await dioClient.post(
          AppConstants.verifyOtp,
          data: formData);

      return ApiResponse.withSuccess(response);

    } catch (e) {

      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  ///////////// Fetch Profile //////////////
  Future<ApiResponse> fetchProfileApi() async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.userId);
    FormData formData = FormData.fromMap({
      "key": key});
    try {
      Response response = await dioClient.post(
        AppConstants.fetchProfileApi,
          data: formData);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////login User Api///////////////////////

  Future<ApiResponse> loginUserApi(String userName,String password) async {
    FormData formData = FormData.fromMap({
      "phone":userName,
      "password":password});

    print(formData.fields);

    try {
      Response response = await dioClient.post(
          AppConstants.loginApi,
          data: formData);

      return ApiResponse.withSuccess(response);

    } catch (e) {

      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////profileApi///////////////////////

  Future<ApiResponse> profileApi() async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.userId);
    FormData formData = FormData.fromMap({
      "key":key,});

    print(formData.fields);

    try {
      Response response = await dioClient.post(
          AppConstants.loginApi,
          data: formData);

      return ApiResponse.withSuccess(response);

    } catch (e) {

      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// registerFarmer ///////////
  Future<ApiResponse> registerFarmerApi(String name,String fatherName,String mobileNumber,
      String villageName,String gramaPanchayath,String hobble,
      String taluka,String districtName,String state,String gender,
      String dob,String age,String handicapped,String minority,String caste,
      File adhaar,File rashan, File panCard,File image, String rashan_no, String pan_no,
      String aadhaar_no) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.newUserId);

    print("===========>>>>>>>      farmer registration started");

    try {
      newAadhar =MultipartFile?.fromFileSync(adhaar?.path);
      newFileRashan =MultipartFile?.fromFileSync(rashan?.path);
      newFileImage =MultipartFile?.fromFileSync(image?.path);
      newFilePan = MultipartFile?.fromFileSync(panCard?.path);

    } on Exception catch (e) {
    print(e); // Only catches an exception of type `Exception`.
    } catch (e) {
    print(e); // Catches all types of `Exception` and `Error`.
    }


    print("==============>>>>>>>>>>      farmer registration try catch completed");



    FormData formData = FormData.fromMap({
      "user_id":key,
      "name":name,
      "fathername_husbandname":fatherName,
      "mobile_number":mobileNumber,
      "village_name":villageName,
      "grama_panchayath":gramaPanchayath,
      "hobble":hobble,
      "taluka":taluka,
      "district_name":districtName,
      "state": state,
      "gender": gender,
      "dob": dob,
      "age": age,
      "handicapped": handicapped,
      "minority": minority,
      "caste": caste,


      "Aadhaar": newAadhar,
      "rashan": newFileRashan,
      "image": newFileImage,
      "pan": newFilePan,

      "rashan_no": rashan_no,
      "pan_no": pan_no,
      "aadhaar_no": aadhaar_no,

    });

    print("==============>>>>>>>>>>      farmer registration form data");

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.registerFarmer,


        data: formData,
      );

      print("==============>>>>>>>>>>      farmer registration done");
      print(response.data);


      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }


  }



  /////////////////fetchFarmerApi///////////////////////

  Future<ApiResponse> fetchFarmerApi() async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.newUserId);
    FormData formData = FormData.fromMap({});

    print(formData.fields);

    try {
      Response response = await dioClient.post(
          AppConstants.fetchFarmer+"/"+key,
          data: formData);

      print("===================***************************>>>>>>>>>>>> key :"+key);

      return ApiResponse.withSuccess(response);

    } catch (e) {

      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }



  ////////// addBankDetails ///////////
  Future<ApiResponse> addBankDetailsApi(String bankName,String ifscCode,String accountNumber,
      String holderName,String branchName,String id, File passboook, String account_type) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.newUserId);
    FormData formData = FormData.fromMap({
      "user_id":key,
      "bank_name":bankName,
      "ifsc":ifscCode,
      "account_no":accountNumber,
      "holder_name":holderName,
      "branch_name":branchName,
      "passbook_image": MultipartFile?.fromFileSync(passboook?.path),
      "account_type": account_type

    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.registerFarmer+"/"+id,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  ////////// addPlotsApi ///////////
  Future<ApiResponse> addPlotsApi(String farmerId,String survey_no,String area,
      String category,String soil_type,String source_of_irrigation,
      String source_of_water,String district,String taluka,String gram_panchayath,
      String village,String pincode,File farmer_plot,File phani_plot,
      String latitude,String longitude) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.farmerId);
    FormData formData = FormData.fromMap({
      "farmer_id":key,
      "survey_no":survey_no,
      "area":area,
      "category":category,
      "soil_type":soil_type,
      "source_of_irrigation":source_of_irrigation,
      "source_of_water":source_of_water,
      "district":district,
      "taluka":taluka,
      "gram_panchayath": gram_panchayath,
      "village": village,
      "pincode": pincode,
      "farmer_plot": MultipartFile.fromFileSync(farmer_plot.path),
      "phani_plot": MultipartFile.fromFileSync(phani_plot.path),
      "latitude": latitude,
      "longitude": longitude,
    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.plots,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////fetchPlotsApi///////////////////////

  Future<ApiResponse> fetchPlotsApi() async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.farmerId);
    FormData formData = FormData.fromMap({});

    print(formData.fields);

    try {
      Response response = await dioClient.post(
          AppConstants.fetchPlots+"/"+key,
          data: formData);

      return ApiResponse.withSuccess(response);

    } catch (e) {

      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// plotExpenditureApi ///////////
  Future<ApiResponse> plotExpenditureApi(String date,String particular_select,
      String amount) async {

    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({
      "date":key,
      "plot_id":key,
      "particular_select":particular_select,
      "amount":amount
    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.plotExpenditure,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// plotExpenditureApi ///////////
  Future<ApiResponse> plotFieldVisit(String cropType,String cropName,String crop_varities,
      String source_of_seeds,String specific_technology,String showingDate,String mixedCrop) async {

    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({
      "crop_type":cropType,
      "plot_id":key,
      "crop_name":cropName,
      "crop_varities":crop_varities,
      "source_of_seeds":source_of_seeds,
      "specific_technology":specific_technology,
      "sowing_date":showingDate,
      "mixed_crop":mixedCrop,
    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.plotFieldVisit,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////fetchPlotExpenditure///////////////////////

  Future<ApiResponse> fetchPlotExpenditure() async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({});

    print(formData.fields);

    try {
      Response response = await dioClient.post(
          AppConstants.fetchPlotExpenditure+"/"+key,
          data: formData);

      return ApiResponse.withSuccess(response);

    } catch (e) {

      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////fetchPlotExpenditure///////////////////////

  Future<ApiResponse> fetchFieldVisit() async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({});

    print(formData.fields);

    try {
      Response response = await dioClient.post(
          AppConstants.fetchFieldVisit+"/"+key,
          data: formData);

      return ApiResponse.withSuccess(response);

    } catch (e) {

      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// plotYieldsApi ///////////
  Future<ApiResponse> plotYieldsApi(String date,String particular_select,
      String amount) async {

    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({
      "date":key,
      "plot_id":key,
      "particular_select":particular_select,
      "amount":amount
    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.plotExpenditure,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// addPlotYieldsApi ///////////
  Future<ApiResponse> addPlotYieldsApi(String moisture,String grade,String pickupdate,String pickupTime,
      String weightType,String weightController,String noOfBags,String totalWeights,String pricePerKg,String totalAmount) async {

    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({
      "plot_id":key,
      "moisture":moisture,
      "grade":grade,
      "pickupdate":pickupdate,
      "pickuptime":pickupTime,
      "weight_type":weightType,
      "weight":weightController,
      "no_of_bags":noOfBags,
      "total_weights":totalWeights,
      "price_per_kg":pricePerKg,
      "total_amount":totalAmount,
    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.plotYield,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////fetchPlotYieldsApi///////////////////////

  Future<ApiResponse> fetchPlotYieldsApi() async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({});

    print(formData.fields);

    try {
      Response response = await dioClient.post(
          AppConstants.fetchYields+"/"+key,
          data: formData);

      return ApiResponse.withSuccess(response);

    } catch (e) {

      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  ////////// addPlotCce ///////////
  Future<ApiResponse> addPlotCceApi(String gpsAccuracy,String department,String observerName,
      String observerDesignation,File observerPhoto,String areaInAcre,
      String manuallyEnteredArea,String areaAudit,String tagSouthWest,File southWest,File fieldImage,
      String length,String breadth,String chooseRandom,String randomLength,
      String randomNumberBreadth,shapeOfCcePlot,String dimensionOfCcePlot,
      File markedPlotPhoto,File cutHarvestPhoto,
      String bmwotca,String bmwotcb,String bmwotcc,String bioMassWeightOfTheCrop,File weightingPhoto,
      File threshingPhoto,File cleaningPhoto,String weightOfCrops,
      String yieldSumOfAllColumns,File cutPlot,File cpWeight,
      File moisturePhoto,File jointPhoto,String obserberMobile) async {

    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);

    FormData formData = FormData.fromMap({
      "plot_id":key,
      "gps_accuracy":gpsAccuracy,
      "department":department,
      "observer_name":observerName,
      "observer_mobile":obserberMobile,
      "observer_designation":observerDesignation,
      "observer_photo":MultipartFile.fromFileSync(observerPhoto.path),
      "area_in_acre":areaInAcre,
      "manually_entered_area":manuallyEnteredArea,
      "area_audit":areaAudit,
      "is_sw":tagSouthWest,
      "south_west_corner":MultipartFile.fromFileSync(southWest.path),
      "field_images":MultipartFile.fromFileSync(fieldImage.path),
      "length":length,
      "breadth":breadth,
      "choose_random":chooseRandom,
      "random_number_length":randomLength,
      "random_number_breadth":randomNumberBreadth,
      "shape_of_cce_plot":shapeOfCcePlot,
      "dimension_of_cce_plot":dimensionOfCcePlot,
      "marked_plot_photo":MultipartFile.fromFileSync(markedPlotPhoto.path),
      "cut_harvest_photo":MultipartFile.fromFileSync(cutHarvestPhoto.path),
      "cut_harvest_photo":MultipartFile.fromFileSync(cutHarvestPhoto.path),
      "bmwotca":bmwotca,
      "bmwotcb":bmwotcb,
      "bmwotcc":bmwotcc,
      "bio_mass_weight_of_the_crop":bioMassWeightOfTheCrop,
      "weightingPhoto":MultipartFile.fromFileSync(weightingPhoto.path),
      "threshing_photo":MultipartFile.fromFileSync(threshingPhoto.path),
      "cleaning_photo":MultipartFile.fromFileSync(cleaningPhoto.path),
      "weight_of_crops":weightOfCrops,
      "yield_sum_of_all_columns":yieldSumOfAllColumns,
      "cut_plot":MultipartFile.fromFileSync(cutPlot.path),
      "cp_weight":MultipartFile.fromFileSync(cpWeight.path),
      "moisture_photo":MultipartFile.fromFileSync(moisturePhoto.path),
      "joint_photo":MultipartFile.fromFileSync(jointPhoto.path),
    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.plotCce,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////fetchPlotCceApi///////////////////////

  Future<ApiResponse> fetchPlotCceApi() async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({});

    print(formData.fields);

    try {
      Response response = await dioClient.post(
          AppConstants.fetchCce+"/"+key,
          data: formData);

      return ApiResponse.withSuccess(response);

    } catch (e) {

      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  ////////// addPlotFieldVisitCropStageApi ///////////
  Future<ApiResponse> addPlotFieldVisitCropStageApi(String cropStage, String cropLossDueTo,String lossDate,File image) async {

    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    var fvId = await SharedPrefManager.getPrefrenceString(AppConstants.fvId);
    FormData formData = FormData.fromMap({
      "fv_id":fvId,
      "plot_id":key,
      "crop_stage": cropStage,
      "crop_loss_due_to":cropLossDueTo,
      "crop_loss_date":lossDate,
      "image":MultipartFile.fromFileSync(image.path)});

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.plotFieldVisitCropStage,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  /////////////////fetch_crop_stage///////////////////////

  Future<ApiResponse> fetchCropStageApi() async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({});

    print(formData.fields);

    try {
      Response response = await dioClient.post(
          AppConstants.fetchCropStage+"/"+key,
          data: formData);

      return ApiResponse.withSuccess(response);

    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// addLabAnalysisApi ///////////
  Future<ApiResponse> addLabAnalysisApi(String date, String quality,String sealNumber) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({
      "sample_date":date,
      "plot_id":key,
      "sample_quality": quality,
      "seal_number":sealNumber,});

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.plotLabAnalysis,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  /////////////////fetchLabAnalysisAPi///////////////////////

  Future<ApiResponse> fetchLabAnalysisAPi() async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({});

    print(formData.fields);

    try {
      Response response = await dioClient.post(
          AppConstants.fetchLabAnalysis+"/"+key,
          data: formData);

      return ApiResponse.withSuccess(response);

    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// plot_soil_information_reg ///////////
  Future<ApiResponse> addPlotSoilInformationReg(String date, String sampleCollectedBy,File photo) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({
      "sample_collected_date":date,
      "sample_collected_by":sampleCollectedBy,
      "plot_id": key,
      "photo":MultipartFile.fromFileSync(photo.path)
    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.plotSoilInformationReg,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  /////////////////fetchLabAnalysisAPi///////////////////////

  Future<ApiResponse> fetchSoilInformationApi() async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({});

    print(formData.fields);

    try {
      Response response = await dioClient.post(
          AppConstants.fetchSoilInformationApi+"/"+key,
          data: formData);

      return ApiResponse.withSuccess(response);

    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  ////////// plot_soil_information_report ///////////
  Future<ApiResponse> plotSoilInformationReport(String sirId, String ph,String ec,
      String oc,String an,String ap,String ah,String as,String zn,String ab,
      String ai,String mn,String ca) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({
      "plot_id": key,
      "sir_id":sirId,
      "ph":ph,
      "ec":ec,
      "oc":oc,
      "an":an,
      "ap":ap,
      "ah":ah,
      "a_s":as,
      "zn":zn,
      "ab":ab,
      "ai":ai,
      "mn":mn,
      "ca":ca,
    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.plotSoilInformationReport,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  /////////////////fetchLabAnalysisReportAPi///////////////////////

  Future<ApiResponse> fetchSoilInformationReportApi(String id) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({});

    print(formData.fields);

    try {
      Response response = await dioClient.post(
          AppConstants.fetchSoilInformationReport+"/"+id,
          data: formData);

      return ApiResponse.withSuccess(response);

    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// fetchProductsApi ///////////
  Future<ApiResponse> fetchProductsApi(String category,String subCategory) async {
    FormData formData = FormData.fromMap({});

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.fetchProducts+"/"+category+"/"+subCategory,
        data: formData);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  ////////// fetchProductsApi ///////////
  Future<ApiResponse> fetchProductsTracktorApi(String category) async {
    FormData formData = FormData.fromMap({});

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
          AppConstants.fetchProducts+"/"+category,
          data: formData);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  /////////////////orderNowApi///////////////////////

  Future<ApiResponse> orderNowApi(String product,String isRent,String rentFromDate,String rentToDate) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.newUserId);
    var farmerId = await SharedPrefManager.getPrefrenceString(AppConstants.farmerId);
    var plotId = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    var productId = await SharedPrefManager.getPrefrenceString(AppConstants.productName);
    FormData formData;

    if(isRent == "Rent"){
      formData = FormData.fromMap({
        "user_id":key,
        "product":productId,
        "is_rent":isRent,
        "rent_from_date":rentFromDate,
        "rent_to_date":rentToDate,
        "farmer_id":farmerId,
        "plot_id":plotId});
    }else{

      formData = FormData.fromMap({
        "user_id":key,
        "product":productId,
        "is_rent":isRent,
        "farmer_id":farmerId,
        "plot_id":plotId,
      });
    }

    print(formData.fields);

    try {
      Response response = await dioClient.post(
          AppConstants.orderNow,
          data: formData);

      return ApiResponse.withSuccess(response);

    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////orderNoApi///////////////////////

  Future<ApiResponse> orderNowRentApi(String product,String isRent,String rentFromDate,String rentToDate) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({
      "user_id":key,
      "product":product,
      "is_rent":isRent,
      "rent_from_date":rentFromDate,
      "rent_to_date":rentToDate,
    });

    print(formData.fields);

    try {
      Response response = await dioClient.post(
          AppConstants.orderNow,
          data: formData);

      return ApiResponse.withSuccess(response);

    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////newCattleApi///////////////////////

  Future<ApiResponse> newCattleApi(String cattieOldNew,String cattleName,String cattleType,String lifeStage,
      String age,String breed,String bodyWeight,String heatDate,String remarks,File photo) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.farmerId);
    FormData formData = FormData.fromMap({
      "farmer_id":key,
      "cattle_old_new":cattieOldNew,
      "cattle_name":cattleName,
      "cattle_type":cattleType,
      "life_stage":lifeStage,
      "age":age,
      "breed":breed,
      "body_weight":bodyWeight,
      "heat_date":heatDate,
      "remarks":remarks,
      "photo":MultipartFile.fromFileSync(photo.path),
    });

    print(formData.fields);

    try {
      Response response = await dioClient.post(
          AppConstants.newCattie,
          data: formData);

      return ApiResponse.withSuccess(response);

    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// fetchCattleApi ///////////
  Future<ApiResponse> fetchCattleApi(String farmerId) async {
    FormData formData = FormData.fromMap({});

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.fetchCattle+"/"+farmerId,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////newCattleShedApi///////////////////////

  Future<ApiResponse> newCattleShedApi(String cattleShedOldNew,String belowCattleName,
      String shedName,String shedGeoTag) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.farmerId);
    FormData formData = FormData.fromMap({
      "farmer_id":key,
      "cattle_shed_new_old":cattleShedOldNew,
      "below_shed_name":belowCattleName,
      "shed_name":shedName,
      "shed_geo_tag":shedGeoTag});

    print(formData.fields);

    try {
      Response response = await dioClient.post(
          AppConstants.newCattleShed,
          data: formData);

      return ApiResponse.withSuccess(response);

    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// fetchCattleShedApi ///////////
  Future<ApiResponse> fetchCattleShedApi(String farmerId) async {
    FormData formData = FormData.fromMap({});

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.fetchCattleShed+"/"+farmerId,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// fetchCattleShedApi ///////////
  Future<ApiResponse> orderListApi() async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.newUserId);

    FormData formData = FormData.fromMap({
      "user_id": key});

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.orderListApi,
        data: formData);

      return ApiResponse.withSuccess(response);

    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  MultipartFile newAadhar =null, newFilePan =null ,newFileRashan=null, newFileImage=null;

  fillFiles() {

    print("giving the files");



  }

}