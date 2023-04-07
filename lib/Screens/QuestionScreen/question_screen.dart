import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Screens/ResistrationScreen/component/custom_button.dart';
import 'package:homelyknock/widgets/custom_loader.dart';

import '../HomeScreen/Model/lead_category_model.dart';
import 'Controller/question_controller.dart';
import 'Model/job_post_model.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({super.key,required  this.data,this.locationId});
   List<CatName> data;
   int? locationId;


  final _questionController = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {

    _questionController.selectedQuestionIndex.value=0;
    _questionController.selectedItemIndex.value=0;
    _questionController.allAnswer.clear();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(

          onPressed: () {
            Navigator.pop(context);
          },

          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF187949),
          ),
        ),
        title: Text(
          'Order',
          style: GoogleFonts.roboto(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF272727)),
        ),
        centerTitle: true,
      ),

      body: Obx(()=>_questionController.isLoading.value?const CustomLoader():
         SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          physics:const BouncingScrollPhysics(),
          child: Obx(()=>
             Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h,),
                Text(
                  data[_questionController.selectedQuestionIndex.value].qs,
                  style: GoogleFonts.roboto(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF272727)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  data[_questionController.selectedQuestionIndex.value].cat.name,
                  style: GoogleFonts.roboto(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF424242)),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data[_questionController.selectedQuestionIndex.value].answers.length,
                    itemBuilder: (BuildContext context, int index) {
                      var result = data[_questionController.selectedQuestionIndex.value].answers[index];
                      return Obx(()=>
                         Container(
                           // height: 55.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color: _questionController.selectedItemIndex.value==index?const Color(0xFFEEFFF7): const Color(0xFFFFFFFF),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      blurRadius: 7,
                                      spreadRadius: 5,
                                      offset: const Offset(0, 2))
                                ]),
                            child: Obx(
                              () => ListTile(
                                onTap: () {
                                  _questionController.selectedItemIndex.value = index;
                                },
                                dense: true,
                                horizontalTitleGap: 0,
                                contentPadding: EdgeInsets.only(left:16.w),
                                title: Text(
                                  result.options,
                                  style: GoogleFonts.roboto(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF272727)),
                                ),
                                trailing: Radio(
                                  visualDensity: const VisualDensity(horizontal: -2,vertical: 0),
                                  activeColor: const Color(0xFF187949),
                                  groupValue:
                                      _questionController.selectedItemIndex.value,
                                  value: index,
                                  onChanged: (value) {
                                    _questionController.selectedItemIndex.value =
                                        value!;
                                  },
                                ),
                              ),
                            )),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => SizedBox(
                          height: 10.h,
                        )),
                SizedBox(
                  height: 50.h,
                ),
                CustomButton(title: data.length==_questionController.selectedQuestionIndex.value+1?"Submit":'Next', onTap: () {
                    if(data.length>_questionController.selectedQuestionIndex.value+1){
                     
                      JobPostModel setdata=JobPostModel(category:data[_questionController.selectedQuestionIndex.value].cat.id, question: data[_questionController.selectedQuestionIndex.value].id, location:locationId!, pAnswer:data[_questionController.selectedQuestionIndex.value].answers[_questionController.selectedItemIndex.value].id);
      
                        print(
                           data[_questionController.selectedQuestionIndex.value].answers[_questionController.selectedItemIndex.value].id
      
                        );
                    
                      _questionController.allAnswer.add(setdata);
                       _questionController.selectedQuestionIndex.value++;
                      _questionController.selectedItemIndex.value=0;
                    }else{
                       JobPostModel setdata=JobPostModel(category:data[_questionController.selectedQuestionIndex.value].cat.id, question: data[_questionController.selectedQuestionIndex.value].id, location:locationId!, pAnswer:data[_questionController.selectedQuestionIndex.value].answers[_questionController.selectedItemIndex.value].id);
                      _questionController.allAnswer.add(setdata);


                      _questionController.submitJobPost(context);
                      
                      
                    }
      
                }),
              ],
            ),
      
          ),
        ),
      ),
    );
  }
}
