<?php

namespace App\Providers\Filament;

use App\Filament\Pages\Auth;
use App\Filament\Pages\Register;
use App\Filament\Resources\BasisPengetahuanResource;
use App\Filament\Resources\GejalaResource;
use App\Filament\Resources\HasilDiagnosaResource;
use App\Filament\Resources\HasilDiagnosaResource\Pages\CreateHasilDiagnosa;
use App\Filament\Resources\KontakResource;
use App\Filament\Resources\PenyakitResource;
use App\Filament\Resources\UserResource;
use App\Livewire\CustomProfileComponent;
use Filament\Http\Middleware\Authenticate;
use Filament\Http\Middleware\AuthenticateSession;
use Filament\Http\Middleware\DisableBladeIconComponents;
use Filament\Http\Middleware\DispatchServingFilamentEvent;
use Filament\Navigation\MenuItem;
use Filament\Navigation\NavigationBuilder;
use Filament\Navigation\NavigationItem;
use Filament\Pages;
use Filament\Pages\Dashboard;
use Filament\Panel;
use Filament\PanelProvider;
use Filament\Support\Colors\Color;
use Filament\Widgets;
use Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse;
use Illuminate\Cookie\Middleware\EncryptCookies;
use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken;
use Illuminate\Routing\Middleware\SubstituteBindings;
use Illuminate\Session\Middleware\StartSession;
use Illuminate\View\Middleware\ShareErrorsFromSession;
use Joaopaulolndev\FilamentEditProfile\FilamentEditProfilePlugin;
use Joaopaulolndev\FilamentEditProfile\Pages\EditProfilePage;

class AdminPanelProvider extends PanelProvider
{
    public function panel(Panel $panel): Panel
    {
        return $panel
            ->default()
            ->id('admin')
            ->path('app')
            ->login(Auth::class)
            ->registration(Register::class)
            ->colors([
                'primary' => Color::Blue
            ])
            ->discoverResources(in: app_path('Filament/Resources'), for: 'App\\Filament\\Resources')
            ->discoverPages(in: app_path('Filament/Pages'), for: 'App\\Filament\\Pages')
            ->pages([
                // Dashboard::class,
            ])
            ->discoverWidgets(in: app_path('Filament/Widgets'), for: 'App\\Filament\\Widgets')
            ->widgets([
                Widgets\AccountWidget::class,
                // Widgets\FilamentInfoWidget::class,
            ])
            ->middleware([
                EncryptCookies::class,
                AddQueuedCookiesToResponse::class,
                StartSession::class,
                AuthenticateSession::class,
                ShareErrorsFromSession::class,
                VerifyCsrfToken::class,
                SubstituteBindings::class,
                DisableBladeIconComponents::class,
                DispatchServingFilamentEvent::class,
            ])
            ->userMenuItems([
                'profile' => MenuItem::make()
                    ->label(fn() => auth()->user()->nama)
                    ->url(fn(): string => EditProfilePage::getUrl())
            ])
            ->navigation(function (NavigationBuilder $builder): NavigationBuilder {
                return $builder->items([
                    NavigationItem::make('Dashboard')
                        ->icon('heroicon-o-home')
                        ->isActiveWhen(fn (): bool => request()->routeIs('filament.admin.pages.dashboard'))
                        ->url(fn (): string => Dashboard::getUrl()),
                    // ...BasisPengetahuanResource::getNavigationItems(),
                    // ...GejalaResource::getNavigationItems(),
                    // ...HasilDiagnosaResource::getNavigationItems(),
                    // ...KontakResource::getNavigationItems(),
                    // ...PenyakitResource::getNavigationItems(),
                    // ...UserResource::getNavigationItems(),
                    NavigationItem::make('Basis Pengetahuan')
                        ->icon('heroicon-o-question-mark-circle')
                        ->isActiveWhen(fn (): bool => request()->routeIs('filament.admin.resources.basis-pengetahuans.*'))
                        ->url(fn (): string => BasisPengetahuanResource::getUrl())
                        ->visible(fn (): bool => auth()->user()->role == "ADMIN"),
                    NavigationItem::make('Gejala')
                        ->icon('heroicon-o-heart')
                        ->isActiveWhen(fn (): bool => request()->routeIs('filament.admin.resources.gejalas.*'))
                        ->url(fn (): string => GejalaResource::getUrl())
                        ->visible(fn (): bool => auth()->user()->role == "ADMIN"),
                    NavigationItem::make('Diagnosa')
                        ->icon('heroicon-o-document-plus')
                        ->isActiveWhen(fn (): bool => request()->routeIs('filament.admin.resources.hasil-diagnosas.create'))
                        ->url(fn (): string => CreateHasilDiagnosa::getUrl())
                        ->visible(fn (): bool => auth()->user()->role == "USER"),
                    NavigationItem::make('Hasil Diagnosa')
                        ->icon('heroicon-o-clipboard-document-check')
                        ->isActiveWhen(fn (): bool => request()->routeIs('filament.admin.resources.hasil-diagnosas.index'))
                        ->url(fn (): string => HasilDiagnosaResource::getUrl()),
                    NavigationItem::make('Kontak')
                        ->icon('heroicon-o-envelope-open')
                        ->isActiveWhen(fn (): bool => request()->routeIs('filament.admin.resources.kontaks.*'))
                        ->url(fn (): string => KontakResource::getUrl())
                        ->visible(fn (): bool => auth()->user()->role == "ADMIN"),
                    NavigationItem::make('Penyakit')
                        ->icon('heroicon-o-bug-ant')
                        ->isActiveWhen(fn (): bool => request()->routeIs('filament.admin.resources.penyakits.*'))
                        ->url(fn (): string => PenyakitResource::getUrl())
                        ->visible(fn (): bool => auth()->user()->role == "ADMIN"),
                    NavigationItem::make('User')
                        ->icon('heroicon-o-user')
                        ->isActiveWhen(fn (): bool => request()->routeIs('filament.admin.resources.users'))
                        ->url(fn (): string => UserResource::getUrl())
                        ->visible(fn (): bool => auth()->user()->role == "ADMIN"),
                ]);
            })
            ->plugins([
                FilamentEditProfilePlugin::make()
                    ->shouldRegisterNavigation(false)
                    ->shouldShowEditProfileForm()
                    ->customProfileComponents([
                        CustomProfileComponent::class
                    ])
            ])
            ->authMiddleware([
                Authenticate::class,
            ]);
    }
}
