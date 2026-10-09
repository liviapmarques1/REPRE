  <?php
  require_once __DIR__ . '/../Settings/permissoes.php';
  ?>

  <style>
    header {
      position: fixed;
      top: 0;
      left: 0;
      padding: 15px 10px;
      background: rgba(255, 255, 255, 0.96);
      border: 1px solid #eeeeee;
      border-radius: 22px;
      box-shadow: 0 8px 25px rgba(70, 60, 130, 0.1);
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 5px;
      z-index: 1000;
      /* ARRUMAR AQUI */
      width: 100vw;
    }

    .logo {
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: 700;
      gap: 10px;
      font-size: 24px;
    }

    .header-options {
      display: flex;
      align-items: center;
      font-size: 24px;
    }

    .header-options button {
      font-weight: 1000;
      background: none;
      border: none;
      font-size: 24px;
      cursor: pointer;
    }

    .representante{
      background: #584d76;
      color: var(--white);
      padding: 5px;
      border-radius: 8px;
      font-weight: 600;
    }
    .bell {
      position: relative;
      width: 44px;
      height: 44px;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-shrink: 0;
      font-size: 21px;
      cursor: pointer;
      transition: 0.25s ease;
    }

    .bell::after {
      content: "";
      position: absolute;
      top: 6px;
      right: 6px;
      width: 7px;
      height: 7px;
      border-radius: 50%;
      background-color: #e74c3c;
      border: 2px solid white;
    }

    .profile {
      width: 30px;
      height: 30px;
      border-radius: 50%;
      box-shadow: 0 3px 10px rgba(109, 66, 219, 0.15);
      transition: 0.25s ease;
      align-self: center;
    }

    .profile:hover {
      transform: scale(1.05);
      border-color: #584391;
    }

    #navbar {
      position: fixed;
      bottom: 0;
      left: 0;
      width: 100%;
      height: auto;

      background: white;

      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      gap: 25px;
      padding-top: 20px;
      padding-bottom: 10px;
      transform: translateY(100%);
      /* Manda o menu lá pra baixo, fica invisivel */
      transition: 0.3s ease;

      z-index: 1000;
    }

    #navbar.opened {
      transform: translateY(0);
    }

    #navbar button {
      border: 1px solid #dddff0;
      padding: 10px 15px;
      border-radius: 50px;
      font-weight: 500;
      background-color: #ded4fc;
      cursor: pointer;
    }

    .nav-closed {
      display: flex;
      align-items: center;
      gap: 8px;
      margin-left: 10px;
      flex: 1;
    }

    .nav-closed a {
      display: flex;
      align-items: center;
      gap: 6px;
      padding: 9px 11px;
      border-radius: 10px;
      text-decoration: none;
      color: #333333;
      font-size: 18px;
      font-weight: 800;
      white-space: nowrap;
      transition: all 0.25s ease;
    }

    ::-webkit-scrollbar {
      width: 8px;
    }

    ::-webkit-scrollbar-track {
      background: var(--fundo);
    }

    ::-webkit-scrollbar-thumb {
      background: rgba(109, 66, 219, 0.3);
      border-radius: 20px;
    }

    ::-webkit-scrollbar-thumb:hover {
      background: var(--main-purple);
    }

    @media (min-width: 768px) {
      header {
        left: 50%;
        transform: translateX(-50%);
        margin-top: 20px;
        box-shadow: 7px 7px 7px #3333333b;
        width: 94%;

      }
      .logo p{
        display: none;
      }
      #menu-btn,
      #navbar button,
      #navbar .profileLink {
        display: none;
      }

      #navbar {
        display: flex;
        flex-direction: row;
        position: static;
        width: auto;
        height: auto;
        background: transparent;
        transform: none;
        justify-content: space-between;
        padding: 0px 0px 0px 10px;
      }

      #navbar a {
        font-size: 18px;
      }
      .representante{
        width: min-content;
      }
    }

    @media (min-width: 1200px) {
      header {
        box-shadow: 16px 7px 16px #33333369;
        padding-left: 30px;
        padding-right: 30px;
      }

      .logo {
        font-size: 28px;
      }
      .logo p{
        display: flex;
      }

      .logo img {
        height: 40px;
      }

      #navbar {
        gap: 100px;
      }

      #navbar a {
        font-size: 20px;
      }

      .profile {
        height: 40px;
        width: 40px;
      }
      .representante{
        width: auto;
        padding: 10px;
      }
    }
  </style>

  <header>
    <a href="home.php" class="logo">
      <img src="Images/Logo.png" alt="Logo" height="30" />
      <p>REPRE</p>
    </a>
    <nav id="navbar">
      <a href="activites.php">Atividades</a>
      <a href="performance.php">Desempenho</a>
      <a href="community.php">Comunidade</a>
      <?php if (seRepresentante()): ?>
      <a href="adminRepresentante.php" class="representante">
        <i class="fa-solid fa-people-group"></i>
        Área do Representante
      </a>
      <?php endif; ?>
      <button id="close-btn">X</button>
    </nav>
    <div class="header-options">
      <button id="menu-btn">☰</button>

      <span class="bell">
        <i class="fa-solid fa-bell"></i>
      </span>

      <a href="profile.php">
        <img src="" class="profile" />
      </a>
    </div>
  </header>