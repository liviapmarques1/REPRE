<!doctype html>
<html lang="pt-BR">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Repre</title>
  <link rel="shortcut icon" href="Images/Logo.png" type="image/x-icon" />
  <link rel="stylesheet" href="Styles/home.css" />
  <link rel="stylesheet" href="Styles/root.css">
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
</head>

<body>
  <div id="headerSet"></div>

  <main>
    <section class="column-1">
      <section class="welcome">
        <div class="welcome-title">
          <h1>Bem-vindo(a), [user]!</h1>
          <p>Confira suas atividades abaixo</p>
        </div>
        <div class="onlyPc-quote">“A alfabetização, portanto, é toda a pedagogia: aprender a ler é aprender a dizer a sua palavra. E a sua palavra humana imita a palavra divina: é criadora.”- Paulo Freire</div>
      </section>
      <!-- <section class="summary-section">
        <h2 class="summary-title">Resumo de suas Atividades</h2>
        <div id="summaryScroll">
          <div class="summary-inner">
            <div class="summary-card green">
              <span class="summary-card-num"><i class="fa-regular fa-circle-check" style="color: #30b75f"></i>
                [x]</span>
              <span class="summary-card-label"> Concluídas </span>
            </div>
            <div class="summary-card yellow">
              <span class="summary-card-num"><i class="fa-solid fa-hourglass-half" style="color: #f39c12"></i>
                [x]</span>
              <span class="summary-card-label"> Pendentes </span>
            </div>
            <div class="summary-card blue">
              <span class="summary-card-num"><i class="fa-solid fa-person-walking" style="color: #3498db"></i>
                [x]</span>
              <span class="summary-card-label"> Em Andamento </span>
            </div>
            <div class="summary-card red">
              <span class="summary-card-num"><i class="fa-solid fa-clock" style="color: #e74c3c"></i>
                [x]</span>
              <span class="summary-card-label"> Atrasadas </span>
            </div>
          </div>
        </div>
      </section> -->
      <section class="wrapper-activities">
        <div class="activities-header">
          <div class="activities-title">
            <h2>Atividades Pendentes</h2>
          </div>
          <!-- <div class="activities-title2">
            <select id="filter-subjects">
              <option value="all">Todas as matérias</option>
              <option value="bancoDeDados">[materia]</option>
            </select>
          </div> -->
        </div>
        <!--Atividades pendentes cards -->
        <div id="cards-container"></div>
        <!-- ----------------------------- -->
        <a href="activities.php" class="see-all-activities">
          Ver todas as atividades
          <i class="fa-solid fa-arrow-right"></i>
        </a>
      </section>
    </section>

    <section class="calendar-section">
      <div class="next-events">
        <h2>Seus Próximos Eventos</h2>
        <div class="calendar">
          <div class="calendar-header">
            <button id="prev">❮</button>
            <h2 id="month"></h2>
            <button id="next">❯</button>
          </div>
          <div class="weekdays">
            <span>D</span>
            <span>S</span>
            <span>T</span>
            <span>Q</span>
            <span>Q</span>
            <span>S</span>
            <span>S</span>
          </div>
          <!--Colocar o Banco de Dados-->
          <div id="calendarDays" class="days"></div>
        </div>
        <div id="eventInfo">Selecione uma data</div>
      </div>

      <!-- PRÓXIMAS ATIVIDADES -->

      <div class="wrapper-next">
        <h2 class="title-next">Próximas atividades</h2>

        <div id="next-container"></div>
      </div>
    </section>
  </main>
  <footer class="footer">© Todos os direitos reservados à New World.
    <div class="quote">
      “A alfabetização, portanto, é toda a pedagogia: aprender a ler é aprender
      a dizer a sua palavra. E a sua palavra humana imita a palavra divina: é
      criadora.”- Paulo Freire
    </div>
  </footer>


  <script src="Script/home.js"></script>
  <script src="Script/headerSet.js"></script>
</body>

</html>