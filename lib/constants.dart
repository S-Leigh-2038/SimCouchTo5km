const String appName = "Simson's Couch to 5km App";

const String startCoundown = "Start";
const String stopCountdown = "Stop";
const String pauseCountdown = "Pause";

const int zeroSeconds = 0;
const int oneSecond = 1;
const int twoSeconds = 2;
const int threeSeconds = 3;
const int sixtySeconds = 60;
const int threeHundredSeconds = 300;

const String startTime = "05 : 00";
const String startTimeMinusTwo = "04 : 58";
const String startTimeMinusThree = "04 : 57";
const String startTimeMinusFour = "04 : 56";
const String startTimeMinusSix = "04 : 54";
const String oneMinute = "01 : 00";
const String endTime = "00 : 00";

const List<String> weeks = [
  'Week 1',
  'Week 2',
  'Week 3',
  'Week 4',
  'Week 5',
  'Week 6',
  'Week 7',
  'Week 8',
  'Week 9'
];

List<int> countdownTimersWeek1 = [
  300,
  60,
  90,
  60,
  90,
  60,
  90,
  60,
  90,
  60,
  90,
  60,
  90,
  60,
  90,
  60,
  90,
  300
];
List<String> walkOrRunWeek1 = [
  "Warm Up Walk",
  "Run",
  "Walk",
  "Run",
  "Walk",
  "Run",
  "Walk",
  "Run",
  "Walk",
  "Run",
  "Walk",
  "Run",
  "Walk",
  "Run",
  "Walk",
  "Run",
  "Walk",
  "Cool Down Walk"
];
List<int> countdownTimersWeek2 = [
  300,
  90,
  120,
  90,
  120,
  90,
  120,
  90,
  120,
  90,
  120,
  90,
  120,
  300
];
List<String> walkOrRunWeek2 = [
  "Warm Up Walk",
  "Run",
  "Walk",
  "Run",
  "Walk",
  "Run",
  "Walk",
  "Run",
  "Walk",
  "Run",
  "Walk",
  "Run",
  "Walk",
  "Cool Down Walk"
];
List<int> countdownTimersWeek3 = [300, 90, 90, 180, 180, 90, 90, 180, 180, 300];
List<String> walkOrRunWeek4 = [
  "Warm Up Walk",
  "Run",
  "Walk",
  "Run",
  "Walk",
  "Run",
  "Walk",
  "Run",
  "Walk",
  "Cool Down Walk"
];

List<int> countdownTimersWeek4 = [300, 180, 90, 300, 150, 180, 90, 300, 300];
List<String> walkOrRunWeek3 = [
  "Warm Up Walk",
  "Run",
  "Walk",
  "Run",
  "Walk",
  "Run",
  "Walk",
  "Run",
  "Cool Down Walk"
];

List<int> countdownTimersWeek5 = [300, 480, 300, 480, 300];
List<String> walkOrRunWeek5 = [
  "Warm Up Walk",
  "Run",
  "Walk",
  "Run",
  "Cool Down Walk"
];

List<int> countdownTimersWeek6 = [300, 600, 180, 600, 300];
List<String> walkOrRunWeek6 = [
  "Warm Up Walk",
  "Run",
  "Walk",
  "Run",
  "Cool Down Walk"
];

List<int> countdownTimersWeek7 = [300, 1500, 300];
List<String> walkOrRunWeek7 = ["Warm Up Walk", "Run", "Cool Down Walk"];

List<int> countdownTimersWeek8 = [300, 1680, 300];
List<String> walkOrRunWeek8 = ["Warm Up Walk", "Run", "Cool Down Walk"];

List<int> countdownTimersWeek9 = [300, 1800, 300];
List<String> walkOrRunWeek9 = ["Warm Up Walk", "Run", "Cool Down Walk"];

List<List<int>> timerWeeks = [
  countdownTimersWeek1,
  countdownTimersWeek2,
  countdownTimersWeek3,
  countdownTimersWeek4,
  countdownTimersWeek5,
  countdownTimersWeek6,
  countdownTimersWeek7,
  countdownTimersWeek8,
  countdownTimersWeek9
];

List<List<String>> walkOrRunkWeeks = [
  walkOrRunWeek1,
  walkOrRunWeek2,
  walkOrRunWeek3,
  walkOrRunWeek4,
  walkOrRunWeek5,
  walkOrRunWeek6,
  walkOrRunWeek7,
  walkOrRunWeek8,
  walkOrRunWeek9
];
