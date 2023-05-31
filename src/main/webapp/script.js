/* ----- Pages & Container to display/hide/set attribute ----- */
const getStarted = document.querySelector(".get-started");
const mainQuiz = document.querySelector(".main-quiz");
const questionAnswers = document.querySelector(".qa-container");
const finalScore = document.querySelector(".final-score");
const timerContainer = document.querySelector(".timer");
const progressBar = document.querySelector(".progress-bar");
/* ----- Buttons ----- */
const startButton = document.querySelector("#start-btn");
const optionButtons = document.querySelectorAll(".option");
const checkButton = document.querySelector(".check-answer");
const nextButton = document.querySelector(".next-question");
const finishButton = document.querySelector(".finish-quiz");
const restartButton = document.querySelector("#restart-btn");
const quitButton = document.querySelectorAll(".quit-quiz");
/* ----- Variables to manipulate innerText ----- */
let myScore = document.querySelector(".my-score");
let totalScore = document.querySelector(".total-score");
let scoreText = document.querySelector(".display-score h3");
let currentQuestion = document.querySelector(".current-question");
let totalQuestions = document.querySelector(".total-questions");
let timer = document.querySelector(".timer span");
/* ----- Initial declaration ----- */
let displayQuiz;
let timerInterval;
let timeUp = document.createElement("h2");
let calculateProgress;
let selectedButton;
let selectedButtonIndex;
let correctAnswerButton;
let correctButtonIndex;
let scorePercent;
/* ----- Quiz questions ----- */
const quizes = [
    {
      question: "1. ¿Qué es una inversión? ",
      options: ["Juntar dinero por un cierto tiempo para una causa destinada", 
                 "Es la cantidad de dinero que se dispone en un proyecto con la finalidad de generar ganancias ",
                 "Generar ganancias a partir de chantajear a los demás"],
      answers: 1, //options index
    },
    {
      question: "2. ¿Cuáles son los principales criterios sobre las inversiones?",
      options: ["Deben ser rentables, tener un riesgo asociado y ser temporales",
                "No tienen riesgo asociado, son de larga duración, son rentables", 
                "Tiene riesgo asociado, es temporal, no es rentable "],
      answers: 0,
    },
    {
      question: "3.	¿Cuáles son todos los tipos de inversión?",
      options: ["Inversiones variables y fijas, inmobiliaria y materias", 
                "Reales, criptomonedas, divisas", 
                "Acciones y participaciones societarias, divisas, materias e inmobiliaria"],
      answers: 2,
    },
    {
      question: "4.	¿Cuál es la diferencia entre ahorro e inversión?",
      options: ["El ahorro es dinámico mientras que la inversión es estática ",
                "El ahorro es estático pues el dinero no sufre ninguna modificación, la inversión es dinámica pues el capital puede crecer",
                 "En la inversión el dinero sufre modificaciones y en el ahorro no"],
      answers: 1,
    },
    {
      question: "5.	¿Cuál es la diferencia entre una inversión a corto y largo plazo?",
      options: ["A corto plazo es considerada la opción más estable, mientras que a largo plazo es arriesgado y es solo un limite imaginario", 
                "A largo plazo es estable, pero a corto plazo se genera solo un límite imaginario abarcando menos de un año ", 
                " A corto plazo dura un año o menos y es arriesgado, a largo plazo abarca más de 3 años, pero este es solo un limite imaginario.Es considerada la opción mas estable"],
      answers: 2,
    },
    {
      question: "6.	Según los especialistas, ¿Cuál es la mejor manera de invertir el dinero?",
      options: ["Diversificar el capital", 
                 "En criptomonedas ",
                 "En divisas"],
      answers: 0,
    },
    {
      question: "7.	¿Qué son los perfiles de riesgo en una inversión?",
      options: ["Es una forma de clasificar a las personas según la forma en que quieren invertir",
                "Una manera de clasificar a cada persona según el riesgo que está dispuesta a asumir y los beneficios que desea generar ", 
                "Son los riesgos por cada inversión realizada "],
      answers: 1,
    },
    {
      question: "8.	¿Cuáles son los tres perfiles de riesgo?",
      options: ["Conservador, moderado y agresivo", 
                "Agresivo, liberal y rentable", 
                "Conservador, accesible, pasivo"],
      answers: 0,
    },
    {
      question: "9. ¿Cómo saber en qué perfil de riesgo se encuadra?",
      options: ["Por el monto ahorrado, experiencia y gustos musicales",
                "Por el tiempo de espera, itinerario y riesgos afrontados ",
                 "Por la trayectoria, el tiempo de espera y el dinero ahorrado"],
      answers: 2,
    },
    {
      question: "10.	¿Cómo afecta la inflación a la inversión? ",
      options: ["Disminuye el riesgo asociado", 
                "Aumenta considerablemente el riesgo asociado ", 
                "Beneficia al inversionista "],
      answers: 1,
    },
];


/* ----- Functions to manipulate styles -----*/
const disableButton = (button) => {
  // Make button disabled by adding a disabled attribute to the button
  button.setAttribute("disabled", "");
  // Set cursor style back to default
  button.style.cursor = "auto";
}

const enableButton = (button) => {
  // Enable the button by removing the disabled attribute from the button
  button.removeAttribute("disabled", ""); 
  // Set cursor style to pointer
  button.style.cursor = "pointer";
};

const removeBackgroundStyle = () => {
  // Remove background color of every option button
  optionButtons.forEach(eachButton => {
    eachButton.style.backgroundColor = "";
  });
};

const optionClicked = (button) => {
  // Set the selected button to be the option that is clicked
  selectedButton = button;
  // Ensure all option buttons' background color are removed before setting new one below
  removeBackgroundStyle();
  // When any option button is clicked, change button to this color:
  button.style.backgroundColor = "rgba(240, 238, 138, 0.29)";
  // When any option is clicked, enable the check answer button
  enableButton(checkButton);
}

/* ----- Functions to set Timer -----*/
const insertTimerText = () => {
  // When timer countdown to 0, ensure the text shows 0
  timer.innerText = 0;
  // Display a 'Times up!' text
  timeUp.textContent = 'TIEMPO FUERA!';
  // Insert the text before the question and answer/options section
  questionAnswers.insertAdjacentElement('beforebegin', timeUp);
  // Align the text to center
  timeUp.style.textAlign = "center";
  // Give this color to the text
  timeUp.style.color = "rgba(255, 32, 32 , 0.8)";
}

const timerCountdown = () => {
  // Every 1000 milliseconds/ 1 second interval, execute this:
  timerInterval = setInterval(() => {
    // If time left is more than 0 second, execute this:
    if(timer.textContent > 0) {
      // Time left should reduce by 1
      timer.innerText--;
    // If time left is less or equal to 0 second, execute this:
    } else if (timer.textContent <= 0) {
      optionButtons.forEach(eachButton => {
        // Disable all option buttons
        disableButton(eachButton);
        // Display correct answer
        displayAnswer();
        // Hide the check answer button and display next question button
        checkButton.style.display ="none";
        nextButton.style.display ="inline";
      })
      // If nothing is selected after time is up execute this:
      if(selectedButton == undefined) {
        // If it is the last question, execute this:
        if(currentQuestion.textContent === totalQuestions.textContent) {
          // Hide next question button and display finish quiz button
          nextButton.style.display ="none";
          finishButton.style.display="inline";
        } else {
          // otherwise, if it's not the last question, display next quesiton button
          nextButton.style.display = "inline";
        }
      }
      insertTimerText();
      // Stop the timer
      clearInterval(timerInterval);
    }
  }, 1000)
}

/* ----- Function to update Progress Bar -----*/
const updateProgressBar = () => {
  // Progress bar 'value' is 1 less than current question because, eg: when you're on question 2, you have only completed 1 question.
  calculateProgress = ((currentQuestion.textContent - 1) / totalQuestions.textContent)*100;
  // Update the progress bar 'value' accordingly
  progressBar.setAttribute("value", calculateProgress);
}

/* ----- Logical process functions -----*/
const startQuiz = () => {
  // Hide the get started button, and display timer
  getStarted.style.display ="none";
  timerContainer.style.display = "inline";
  // Disable check answer button as nothing is selected
  disableButton(checkButton);
  // Set the total questions to be the quiz questions' length
  totalQuestions.innerText = quizes.length;
  // Display the main quiz container
  mainQuiz.style.display = "inline";
  // Start timer countdown
  timerCountdown();
  // Set question to be the first question in the quizes array
  question.innerText = quizes[0].question;
  // Loop through each button and display the options text in correct order
  for(i = 0; i < optionButtons.length; i++) {
    optionButtons.item(i).innerText = quizes[0].options[i]
  }
  // increase the current question count from 0 to 1
  currentQuestion.innerText++;
}


const checkAnswer = () => {
  // If current question is the last question, execute this:
  if(currentQuestion.textContent >= quizes.length) {
    // Hide next question and check answer button, and display finish quiz button
    nextButton.style.display="none"
    checkButton.style.display="none"
    finishButton.style.display = "inline"
  } else {
    // If not the last question, hide check answer button and display next button
    checkButton.style.display = "none";
    nextButton.style.display="inline";
  };
  selectedButton.style.backgroundColor = "rgba(255,0, 26, 0.3)"
  // Display answer
  displayAnswer();
  // Ensure thet imer countdown is stopped
  clearInterval(timerInterval);
  // Add to score depending on if answered correctly
  addScore();
  // Disable each option button
  optionButtons.forEach(eachButton => {
    disableButton(eachButton)
  });
};


const displayAnswer = () => {
  // Find out the correct answer button where it matches answer in quizes array
  correctAnswerButton = document.querySelector(`[data-index="${quizes[currentQuestion.textContent-1].answers}"]`)
  // Find the correct answer button's index
  correctButtonIndex = quizes[currentQuestion.textContent-1].answers
  // Change the correct answer button to this color
  correctAnswerButton.style.backgroundColor = "rgba(40,247,40,0.3)";
}

const addScore = () => {
  // Find out the index of the selected button
  selectedButtonIndex = selectedButton.getAttribute("data-index")
  // If the selected button is the correct answer, execute this:
  if(selectedButtonIndex == correctButtonIndex) {
    // Increase the score by 1 each time
    myScore.innerText++;
    // Find out the score percentage according to score obtained
    scorePercent = (myScore.textContent / totalQuestions.textContent) * 100
  // If it's not the correct answer, then just leave it as it is
  } else {
    myScore;
  }
  // If score percentage is less than 50
  if(scorePercent < 50 || myScore.textContent == 0) {
    // Display text 'Better luck next time!'
    scoreText.innerText = 'Buena suerte a la próxima!'
  // If score percentage is more than or equal to 50, then show text below
  document.getElementById("contador").value = JSON.stringify(myScore.textContent);
  } else {
    scoreText.innerText = "Bien hecho, lo lograste!"
    document.getElementById("contador").value = JSON.stringify(myScore.textContent);
  }
};

const nextQuestion = () => {
  // Display the main quiz content
  mainQuiz.style.display = "inline";
  // Remove the 'Times Up!' text
  timeUp.textContent = "";
  // Reset time left to 15
  timer.innerText = 15;
  // hide the next question button and display check answer button
  nextButton.style.display = "none";
  checkButton.style.display = "inline";
  // Increase current question by 1 everytime
  currentQuestion.innerText++;
  // Disable check answer button
  disableButton(checkButton);
  // Update progress bar accordingly
  updateProgressBar();
  // Start timer countdown
  timerCountdown();
  // Set question to be the correct question form the quizes array
  question.innerText = quizes[currentQuestion.textContent - 1].question;
  // Change all option buttons to the appropriate text
  for(i = 0; i < optionButtons.length; i++) {
    optionButtons.item(i).innerText = quizes[currentQuestion.textContent - 1].options[i]
  }
};

const restartQuiz = () => {
  // Reset score and current question to 0, time left to 15
  myScore.innerText = 0;
  currentQuestion.innerText = 0;
  timer.innerText = 15;
  // Enable each option button, and remove backgound color
  optionButtons.forEach(eachButton => {
    enableButton(eachButton)
    removeBackgroundStyle(eachButton)
  });
  // Display check answer button, hide finish quiz button and final score content
  checkButton.style.display = "inline";
  finishButton.style.display="none";
  finalScore.style.display="none";
  // Update progress bar accordingly and start quiz
  updateProgressBar();
  startQuiz();
}


/* ----- Buttons event listeners -----*/
// When get started button is clicked, execute this:
startButton.addEventListener("click", startQuiz);

// When check answer button is clicked, execute this:
checkButton.addEventListener("click", checkAnswer);

// When next question button is clicked, execute this:
nextButton.addEventListener("click", () => {
  // Go to the next question, remove background color, and enable all options button
  nextQuestion();
  removeBackgroundStyle();
  optionButtons.forEach(eachButton => {
    enableButton(eachButton)
  })
});

// When finish quiz button is clicked
finishButton.addEventListener("click", () => {
  // Remove 'Time up!' text
  timeUp.textContent = '';
  // Display final score content, and hide main quiz content
  finalScore.style.display = 'flex';
  mainQuiz.style.display = "none";
  // Total score should be same as the total available questions
  totalScore.innerText = totalQuestions.textContent;
  // Stop timer
  clearInterval(timerInterval);
})

// When restart button is clicked, ;execute this:
restartButton.addEventListener("click", restartQuiz);

// Loop over quit quiz buttons (There are 2)
quitButton.forEach(button => {
  // When quit quiz button is clicked, execute this:
  button.addEventListener("click", () => {
    // Display get started content, hide main quiz and final score content
    getStarted.style.display ="flex";
    mainQuiz.style.display="none";
    finalScore.style.display="none";
    // Refresh page
    location.reload();
  })
});
