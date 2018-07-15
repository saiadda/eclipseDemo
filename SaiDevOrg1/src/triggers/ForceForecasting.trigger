trigger ForceForecasting on User (before insert) {
    
    for (user userInLoop: Trigger.new){
        userInLoop.ForecastEnabled=true;
    }

}