-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 16-12-2022 a las 17:10:53
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `san_juan_tec`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `id` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `contenido` varchar(500) NOT NULL,
  `clases` varchar(100) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `requisitos` varchar(500) NOT NULL,
  `precio` varchar(100) NOT NULL,
  `estudiantes` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id`, `nombre`, `contenido`, `clases`, `descripcion`, `requisitos`, `precio`, `estudiantes`) VALUES
(1, 'Diseño UX', 'Diseño UX/UI , Diseño UX/UI Avanzado , UX Writing , UX Research', 'Lunes 18:00 a 19:30, Martes 18:00 a 19:30, Jueves 18:00 a 19:30.', 'Durante el curso aprenderás los conceptos fundamentales y las buenas prácticas relacionadas con el diseño de experiencia e interfaz, desarrollando habilidades avanzadas en el diseño de prototipos a través de figma. Al finalizar el curso los participantes producirán un prototipo para sumar a sus portfolios o para desarrollar en los siguientes cursos complementarios que ofrece el programa.', 'Pc, Conexión a Internet.', 'GRATIS', ''),
(2, 'Introducción al desarrollo en Python', 'Fundamentos de Programacion Python', 'Martes 15 a 16:30, Jueves de 15 a 16:30, Jueves de 16:30 a 18:00', 'Este curso es ideal para introducirte al mundo de la programación haciendo foco en desarrollar una habilidad base como lo es la programación orientada a objetos. En el curso aprenderás cómo enfrentar un lenguaje de programación desde cero y sin conocimientos previos. Adquiriremos habilidades para resolver cualquier problema de la vida real.', 'Saber utilizar Pc. Conexión a Internet', 'GRATIS', ''),
(3, 'Desarrollo Web', 'HTML, CSS, JS', 'Lunes 15:30 a 17 hs, Miércoles 15 hs, Miércoles 15:30 hs', 'En este curso aprenderás a maquetar una pagina web desde cero haciendo uso de los diferentes tipos de lenguajes destinados al desarrollo web. Tendrás la posibilidad obtener conocimientos prácticos y teóricos necesarios para ser desarrolladores FrontEnd. Obtendrás las bases fundamentales para afrontar los demás cursos complementarios que ofrece el Programa (CSS avanzado, JavaScript, Angular, etc).', 'PC, Internet.', 'GRATIS', ''),
(4, 'Fundamentos React.js', 'Javascript, React Js', 'Martes de 18 30 a 20, Miércoles de 18 30 a 20, Jueves de 18 30 a 20', 'En este curso comenzaremos a introducirnos en el mundo del Frontend, a través de este Framework basado en JavaScript. Se dictara una breve introducción en JavaScript para luego abordar las características de React. Aprenderás a realizar múltiples conexiones, harás demostraciones con distintas APIs y podrás llevar a la acción tus ideas, también, aprenderás la lógica de React.', 'Pc, Conexión a Internet. Conocimientos previos sugeridos: JavaScript Avanzado. Desarrollo Web. Conocimientos sobre Eventos. Internet', 'GRATIS', ''),
(5, 'Angular Avanzado – Java – Spring Boot', 'Conocimientos previos sugeridos: Curso de desarrollo web.  Curso de fundamentos de Angular', 'Martes de 15:00 a 16:30, Jueves de 15:00 a 16:30, Viernes de 15:00 a 16:30', 'En este curso conocerás las bases del lenguaje JAVA y las bases relacionales como MySQL, adquiriendo el conocimiento necesario para desarrollar API’s del lado del servidor mediante el framework Spring Boot. Aprenderás a consumir estas API’s con una aplicación Angular por medio de un proyecto web basado en la gestión de tareas, de esta forma unificarás el Front-End y el Back-End con el acceso a datos. Desarrollaras un proyecto individual con las herramientas adquiridas a lo largo del curso. ', 'PC/Notebook, Conexión a Internet', 'GRATIS', ''),
(6, 'Laravel Avanzado', 'Conocimientos previos sugeridos: Pensamiento lógico. Cursos de Desarrollo web. JavaScript. Introducción a Laravel', 'Martes de 15:00 a 16:30, Jueves de 15:00 a 16:30, Jueves de 16:30 a 18:00.', 'Laravel se a convertido en una de las tecnologías de desarrollo web mas implementadas en todo el mundo gracias a su versatilidad y agilidad.  En este curso llevaras tus conocimientos a otro nivel. Aprenderás a construir aplicaciones dinámicas obteniendo datos en tiempo real desde un servidor. Aprenderás a implementar Inertia, la tecnología que permite usar Vue.js en tus aplicaciones desarrolladas con Laravel.', ' Pc, Internet.', 'GRATIS', ''),
(7, 'Base de Datos Avanzado', 'Conocimientos previos sugeridos: Pensamiento lógico. Bases en programación. Fundamentos en Base de datos', 'Martes 1600 a 17:30, Miércoles 15:00 a 16:30,  Jueves 9:30 a 11:00.', 'Este curso te permitirá aprender a realizar consultas básicas y avanzadas sobre cualquier base de datos relacional empleando el lenguaje SQL.  Trabajaremos con PostgreSQL que es uno de los Sistemas de Gestión de Bases de Datos Relacionales más populares del mercado. Al finalizar el curso serás capaz de realizar consultas SQL con diferentes niveles de complejidad, lo que te permitirá mejorar tus perspectivas profesionales.', 'Computadora, Conexión a internet.', 'GRATIS', ''),
(8, 'Python Avanzado', 'Conocimientos previos sugeridos: Lógica de programación, Fundamentos en Python, Programación orientada a objetos.', 'Lunes 20:00 a 21:30, Martes 19:00 a 20:30 , Martes 20:45 a 22:15', 'Python es un lenguaje sencillo de entender, fácil de usar, con muchas posibilidades de implementación en la ciencia de datos, backend, IA y demás ramas de la programación. En este curso llevaras tus conocimientos en Python a otro nivel, aprenderás a implementar conocimientos avanzados  para poder aplicarlos en diferentes proyectos de mayor complejidad como lo es el software que maneja datos para una empresas o emprendimientos.', 'PC/Notebook, Windows 10 o superior, Memoria RAM mínimo 4GB, Internet.', 'GRATIS', ''),
(9, 'Optimización y Accesibilidad Web', 'Conocimientos previos sugeridos:  Desarrollo web.', ' Lunes de 18 a 19:30 ;Miércoles de 18 a 21.', 'Lleva tu código frontend a un nivel profesional reduciendo los tiempos de carga de tus sitios web implementando herramientas de optimización inteligentes. Vas a aprender a desarrollar código que permita llegar a todo tipo de usuarios Implementando características de accesibilidad en tus sitios.  Al final del curso se les brindará una experiencia real de trabajo en equipo integrando con otras disciplinas para desarrollar una aplicación en conjunto.', ' PC, Internet.', 'GRATIS', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
