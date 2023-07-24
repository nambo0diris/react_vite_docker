# React + TypeScript + Vite

**Как запустить проект:**
1. Установить docker и git, например, на vds
2. Скачать туда проект
3. `cd react_docker`
4. Создать docker-образ `docker build -t react_docker_image .`
5. `docker run -p -d <ip по которому доступен vds>:<port>:80 react_docker_image`



Этот шаблон предоставляет минимальную настройку для работы с React в Vite с HMR и некоторыми правилами ESLint.

На данный момент доступны два официальных плагина:

`@vitejs/plugin-react` использует Babel для быстрого обновления (Fast Refresh).
`@vitejs/plugin-react-swc` использует SWC для быстрого обновления (Fast Refresh).
Расширение конфигурации ESLint
Если вы разрабатываете производственное приложение, рекомендуем обновить конфигурацию для включения правил линтинга, основанных на типах:

Настройте свойство parserOptions на верхнем уровне следующим образом:
js
Copy code
`parserOptions: {
    ecmaVersion: 'latest',
    sourceType: 'module',
    project: ['./tsconfig.json', './tsconfig.node.json'],
    tsconfigRootDir: __dirname,
}`
 
Замените plugin: `@typescript-eslint/recommended` на `plugin:@typescript-eslint/recommended-type-checked` или `plugin:@typescript-eslint/strict-type-checked`
По желанию добавьте `plugin:@typescript-eslint/stylistic-type-checked`
Установите `eslint-plugin-react` и добавьте `plugin:react/recommended` и `plugin:react/jsx-runtime` в список extends