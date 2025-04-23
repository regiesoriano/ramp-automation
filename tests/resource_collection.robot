*** Settings ***
#Environment Variables
Resource    ../environment_variables.robot

#Assertions
Resource    ../resources/keywords/assertions/ramp_sign-up.robot
Resource    ../resources/keywords/assertions/ramp_sign-in.robot

#Libraries
Resource    ../resources/libraries.robot

#Page Actions
Resource    ../resources/keywords/page_actions/common.robot
Resource    ../resources/keywords/page_actions/ramp_sign-up.robot
Resource    ../resources/keywords/page_actions/ramp_sign-in.robot

#Page Objects
Resource    ../resources/keywords/page_objects/ramp_sign-up_objects.robot
Resource    ../resources/keywords/page_objects/ramp_sign-in_objects.robot

#Utilities
Resource    ../resources/keywords/utilities/headful.robot
Resource    ../resources/keywords/utilities/protonmail.robot
Resource    ../resources/keywords/utilities/ramp_sign-up.robot