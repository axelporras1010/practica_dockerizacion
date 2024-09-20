<main class="devwebcamp">
    <h2 class="devwebcamp__heading"><?php echo $titulo; ?></h2>
    <p class="devwebcamp__descripcion">Conoce la conferencia mas importante de LatinoAmerica</p>

    <div class="devwebcamp__grid">
        <div <?php aos_animacion(); ?> class="devwebcamp__imagen">
            <picture>
                <source srcset="build/img/sobre_devwebcamp.avif"  type="image/avif">
                <source srcset="build/img/sobre_devwebcamp.webp"  type="image/webp">
                <img loading="lazy" width="200" height="300" src="build/img/sobre_devwebcamp.jpg" alt="Imagen DevWebCamp">
            </picture>
        </div>

        <div class="devwebcamp__contenido">
            <p <?php aos_animacion(); ?> class="devwebcamp__texto">
                In lacinia sapien quis lorem consequat dapibus. In hac habitasse platea dictumst. Duis ac felis sagittis, viverra ex ac, consectetur diam. Sed ornare convallis erat at condimentum. Sed mollis libero eu luctus sagittis. Donec hendrerit arcu id nunc dignissim, quis lobortis orci vulputate. Mauris ultricies eleifend pharetra. Pellentesque quam justo, condimentum ac eros vitae, tincidunt viverra nulla. Nullam semper magna ac neque vehicula tincidunt. 
            </p>

            <p <?php aos_animacion(); ?> class="devwebcamp__texto">
                In lacinia sapien quis lorem consequat dapibus. In hac habitasse platea dictumst. Duis ac felis sagittis, viverra ex ac, consectetur diam. Sed ornare convallis erat at condimentum. Sed mollis libero eu luctus sagittis. Donec hendrerit arcu id nunc dignissim, quis lobortis orci vulputate. Mauris ultricies eleifend pharetra. 
            </p>
        </div>
    </div>
</main>